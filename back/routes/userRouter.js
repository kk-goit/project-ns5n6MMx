import express from 'express';
import { registrationHandler } from '../controllers/userController.js';
import validationMiddleware from '../middlewares/validationMiddleware.js';
import { registrationSchema } from '../schemas/userSchemas.js';

import validateBody from "../helpers/validateBody.js";
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
import upload from "../middleware/upload.js";

const userRouter = express.Router()
    .post("/registration", validationMiddleware(registrationSchema), registrationHandler)
    .post("/login", validateBody(loginSchema), login)
    .post("/logout", authenticate, logout)
    .get("/:id", getUserById)
    .get("/me", authenticate, getCurrent)
    .patch("/avatars", authenticate, upload.single("avatar"), updateAvatar);

export default userRouter;