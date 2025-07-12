import jwt from "jsonwebtoken";
import { User } from "../db/models/users.js";

async function createUser(name, email, password, avatar) {
  const user = await User.create({
    name,
    email,
    password,
    avatar,
  });
  return user;
}

async function getUserById(userId) {
  return await User.findByPk(userId);
}

async function getUserByEmail(email) {
  return await User.findOne({ where: { email } });
}

function generateToken(userId) {
  return jwt.sign({ id: userId }, process.env.JWT_SECRET, {
    expiresIn: process.env.JWT_EXPIRES || "1h",
  });
}

function verifyToken(token) {
  return jwt.verify(token, process.env.JWT_SECRET);
}

async function updateUserToken(userId, token) {
  return await User.update({ token }, { where: { id: userId } });
}

export default {
  createUser,
  getUserById,
  getUserByEmail,
  generateToken,
  verifyToken,
  updateUserToken,
};
