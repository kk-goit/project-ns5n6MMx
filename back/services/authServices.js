import jwt from "jsonwebtoken";
import sequelize from "sequelize";
import { User, UserFollow } from "../db/models/users.js";
import { Recipe, RecipeUserFavorite } from "../db/models/recipes.js";

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

async function getUserDataById(userId, fullInfo = true) { 
  return {
    recipes:
      await Recipe.count({ where: { user_id: userId } }),
    followers:
      await UserFollow.count({ where: { followee_user_id: userId } }),
    followees:
      fullInfo ?
        await UserFollow.count({ where: { follower_user_id: userId } })
        : undefined,
    favoriteRecipes:
      fullInfo ?
        await RecipeUserFavorite.count({ where: { user_id: userId } })
        : undefined
  }
}

export default {
  createUser,
  getUserById,
  getUserDataById,
  getUserByEmail,
  generateToken,
  verifyToken,
  updateUserToken,
};
