import bcrypt from "bcryptjs";
import { generateAvatar } from "../services/avatarService.js";
import authServices from "./authServices.js";
import { User } from "../db/models/users.js";
import ConflictError from "../errors/conflictError.js";
import { UniqueConstraintError } from "sequelize";

export const registration = async (body) => {
    try {
        const avatar = generateAvatar(body.email);
        const password = await bcrypt.hash(body.password, 10);
        const user = await User.create({
            ...body,
            password,
            avatar,
        });

        if (!user) { 
            throw new HttpError(409, "Registration failed");
        }
        const token = authServices.generateToken(user.id);
        const result = await authServices.updateUserToken(user.id, token);

        if (!result) {
            await user.destroy();
            throw new HttpError(409, "Registration failed");
        }
        return {
            token,
            user: {
                id: user.id,
                email: user.email,
                name: user.name,
                avatar: user.avatar,
            }
        };
    } catch (error) {
        if (error instanceof UniqueConstraintError) {
            throw new ConflictError('Email in use');
        }
        throw error;
    }
}