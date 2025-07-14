import express from 'express';
import { registrationHandler } from '../controllers/userController.js';
import { bodyValidationMiddleware } from '../middlewares/validationMiddleware.js';
import authenticate from "../middlewares/authenticate.js";

import { registrationSchema } from '../schemas/userSchemas.js';
import { loginSchema } from "../schemas/usersSchemas.js";
import {
  login,
  logout,
  getCurrent,
  getUserById
} from "../controllers/authControllers.js";

import {
  followUser,
  unfollowUser,
  getFollowers,
  getFollowing,
} from "../controllers/follows.js";

import {
  updateAvatar
} from "../controllers/profileController.js";
import upload from "../middlewares/upload.js";

const userRouter = express.Router()
    .post("/register", bodyValidationMiddleware(registrationSchema), registrationHandler)
    .post("/login", bodyValidationMiddleware(loginSchema), login)
    .post("/logout", authenticate, logout)
    .get("/me", authenticate, getCurrent)
    .patch("/avatar", authenticate, upload.single("avatar"), updateAvatar)

    .get("/:id/followers", authenticate, getFollowers) // Список тих, хто підписаний на вказаного користувача
    .get("/followees", authenticate, getFollowing) // Список тих, на кого підписаний користувач
    .post("/followees/:id", authenticate, followUser) // Підписка
    .delete("/followees/:id", authenticate, unfollowUser) // Відписка

    .get("/:id", getUserById);

export default userRouter;
