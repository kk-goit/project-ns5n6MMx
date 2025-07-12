import { User, UserFollow } from "../db/models/users.js";

// Get users who follow the specified user
async function getFollowers(userId) {
  const user = await User.findByPk(userId, {
    include: [
      {
        model: User,
        as: "followers",
        attributes: ["id", "name", "email", "avatar"],
      },
    ],
  });

  return user ? user.followers : [];
}

// Get users that the specified user is following
async function getFollowing(userId) {
  const user = await User.findByPk(userId, {
    include: [
      {
        model: User,
        as: "followees",
        attributes: ["id", "name", "email", "avatar"],
      },
    ],
  });

  return user ? user.followees : [];
}

// Create a follow relationship
async function followUser(followerId, followeeId) {
  // Check if the followee user exists
  const followee = await User.findByPk(followeeId);
  if (!followee) {
    return null;
  }

  // Check if the relationship already exists
  const existingFollow = await UserFollow.findOne({
    where: {
      follower_user_id: followerId,
      followee_user_id: followeeId,
    },
  });

  if (existingFollow) {
    return existingFollow; // Already following
  }

  // Create the follow relationship
  const follow = await UserFollow.create({
    follower_user_id: followerId,
    followee_user_id: followeeId,
  });

  return follow;
}

// Remove a follow relationship
async function unfollowUser(followerId, followeeId) {
  const result = await UserFollow.destroy({
    where: {
      follower_user_id: followerId,
      followee_user_id: followeeId,
    },
  });

  return result > 0;
}

export default {
  getFollowers,
  getFollowing,
  followUser,
  unfollowUser,
};
