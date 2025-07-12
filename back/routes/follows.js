import express from "express";
import {
  followUser,
  unfollowUser,
  getFollowers,
  getFollowing,
} from "../controllers/follows.js";

const router = express.Router();

// Підписка
router.post("/:id/follow", followUser);

// Відписка
router.delete("/:followeeId/unfollow/:followerId", unfollowUser);

// Список тих, хто підписаний на користувача
router.get("/:id/followers", getFollowers);

// Список тих, на кого підписаний користувач
router.get("/:id/following", getFollowing);

export default router;
