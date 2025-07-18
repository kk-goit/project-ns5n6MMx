import bcrypt from "bcryptjs";
import { generateAvatar } from "../services/avatarService.js";
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
        return {
            id: user.id,
            email: user.email,
            name: user.name,
            avatar: user.avatar,
        };
    } catch (error) {
        if (error instanceof UniqueConstraintError) {
            throw new ConflictError('Email in use');
        }
        throw error;
    }
}