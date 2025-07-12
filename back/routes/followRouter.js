import express from "express";
import authenticate from "../middlewares/authenticate.js";
import {
  getFollowers,
  getFollowing,
  followUser,
  unfollowUser,
} from "../controllers/followControllers.js";

const followRouter = express.Router();

// Get users who follow the authenticated user
followRouter.get("/followers", authenticate, getFollowers);

// Get users that the authenticated user is following
followRouter.get("/following", authenticate, getFollowing);

// Follow a user
followRouter.post("/follow/:followeeId", authenticate, followUser);

// Unfollow a user
followRouter.delete("/unfollow/:followeeId", authenticate, unfollowUser);

export default followRouter;
