import express from 'express';
import { registrationHandler } from '../controllers/userController.js';
import { bodyValidationMiddleware } from '../middlewares/validationMiddleware.js';
import { registrationSchema } from '../schemas/userSchemas.js';

import { loginSchema } from "../schemas/usersSchemas.js";
import {
  login,
  logout,
  getCurrent,
  getUserById
} from "../controllers/authControllers.js";
import authenticate from "../middlewares/authenticate.js";

import {
  updateAvatar
} from "../controllers/profileController.js";
import upload from "../middlewares/upload.js";

const userRouter = express.Router()
    .post("/registration", bodyValidationMiddleware(registrationSchema), registrationHandler)
    .post("/login", bodyValidationMiddleware(loginSchema), login)
    .post("/logout", authenticate, logout)
    .get("/me", authenticate, getCurrent)
    .patch("/avatars", authenticate, upload.single("avatar"), updateAvatar)
    .get("/:id", getUserById);

export default userRouter;
