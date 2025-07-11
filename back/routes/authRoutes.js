import express from "express";
import {
  updateAvatar
} from "../controllers/authController.js";
import authMiddleware from "../middleware/authMiddleware.js";
import upload from "../middleware/upload.js";

const router = express.Router();

router.patch("/avatars", authMiddleware, upload.single("avatar"), updateAvatar);

export default router;