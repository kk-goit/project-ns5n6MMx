import followService from "../services/followServices.js";
import HttpError from "../helpers/HttpError.js";

// Get users who follow the authenticated user's profile
export const getFollowers = async (req, res, next) => {
  try {
    const userId = req.user.id;
    const followers = await followService.getFollowers(userId);

    res.json({
      followers: followers.map((follower) => ({
        id: follower.id,
        name: follower.name,
        email: follower.email,
        avatar: follower.avatar,
      })),
    });
  } catch (error) {
    next(error);
  }
};

// Get users that the authenticated user is following
export const getFollowing = async (req, res, next) => {
  try {
    const userId = req.user.id;
    const following = await followService.getFollowing(userId);

    res.json({
      following: following.map((followee) => ({
        id: followee.id,
        name: followee.name,
        email: followee.email,
        avatar: followee.avatar,
      })),
    });
  } catch (error) {
    next(error);
  }
};

// Add a user to the authenticated user's following list
export const followUser = async (req, res, next) => {
  try {
    const followerId = req.user.id;
    const { followeeId } = req.params;

    if (followerId === parseInt(followeeId)) {
      throw HttpError(400, "Cannot follow yourself");
    }

    const result = await followService.followUser(followerId, followeeId);

    if (!result) {
      throw HttpError(404, "User not found");
    }

    res.status(201).json({
      message: "Successfully started following user",
    });
  } catch (error) {
    next(error);
  }
};

// Remove a user from the authenticated user's following list
export const unfollowUser = async (req, res, next) => {
  try {
    const followerId = req.user.id;
    const { followeeId } = req.params;

    const result = await followService.unfollowUser(followerId, followeeId);

    if (!result) {
      throw HttpError(404, "Follow relationship not found");
    }

    res.json({
      message: "Successfully unfollowed user",
    });
  } catch (error) {
    next(error);
  }
};
