import { User, UserFollow } from "../db/models/users.js";

// Підписатися на користувача
export const followUser = async (req, res, next) => {
  try {
    const followerId = parseInt(req.user.id);
    const followeeId = parseInt(req.params.id);

    if (followerId === followeeId) {
      return res.status(400).json({ message: "Cannot follow yourself." });
    }

    await UserFollow.findOrCreate({
      where: {
        follower_user_id: followerId,
        followee_user_id: followeeId,
      },
    });

    res.status(200).json({ message: "Successfully followed user." });
  } catch (error) {
    next(error);
  }
};

// Скасувати підписку
// DELETE /api/users/followees/:id
export const unfollowUser = async (req, res, next) => {
  try {
    const followeeId = parseInt(req.params.id);
    const followerId = parseInt(req.user.id);

    const deleted = await UserFollow.destroy({
      where: {
        follower_user_id: followerId,
        followee_user_id: followeeId,
      },
    });

    if (deleted === 0) {
      return res.status(404).json({ message: "Subscription not found." });
    }

    res.status(200).json({ message: "Unfollowed successfully." });
  } catch (error) {
    next(error);
  }
};

// Отримати всіх followers (хто підписався на користувача)
export const getFollowers = async (req, res, next) => {
  try {
    const userId = parseInt(req.params.id);

    const user = await User.findByPk(userId, {
      include: {
        model: User,
        as: "followers",
        through: { attributes: [] },
      },
    });

    res.status(200).json(user.followers);
  } catch (error) {
    next(error);
  }
};

// Отримати всіх followees (на кого підписаний користувач)
export const getFollowing = async (req, res, next) => {
  try {
    const userId = parseInt(req.user.id);

    const user = await User.findByPk(userId, {
      include: {
        model: User,
        as: "followees",
        through: { attributes: [] },
      },
    });

    res.status(200).json(user.followees);
  } catch (error) {
    next(error);
  }
};
