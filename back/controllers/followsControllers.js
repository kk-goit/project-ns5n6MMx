import { paginate } from "../utils/paginationService.js";
import HttpError from "../errors/httpError.js";
import followsServices from "../services/followsServices.js";

// Підписатися на користувача
export const followUser = async (req, res) => {
    const followerId = parseInt(req.user.id);
    const followeeId = parseInt(req.params.id);

    if (followerId === followeeId) {
        throw new HttpError(400, "Cannot follow yourself.");
    }

    await followsServices.followUser(followerId, followeeId);
    res.status(201).json({ message: "Added to followers" });
};

// Скасувати підписку
// DELETE /api/users/followees/:id
export const unfollowUser = async (req, res) => {
    const followeeId = parseInt(req.params.id);
    const followerId = parseInt(req.user.id);

    const deleted = await followsServices.unfollowUser(followerId, followeeId);

    if (!deleted) {
        throw new HttpError(404, "Subscription not found.");
    }

    res.status(204).end();
};

// Отримати всіх followers (хто підписався на користувача)
export const getFollowers = async (req, res) => {
    const userId = parseInt(req.params.id);
    const currentUserId = req.user.id;

    const followers = await followsServices.getFollowers(userId, currentUserId);

    res.status(200).json(
        paginate(req, followers)
    );
};

// Отримати всіх followees (на кого підписаний користувач)
export const getFollowing = async (req, res) => {
    const userId = parseInt(req.user.id);

    const followees = await followsServices.getFollowing(userId);

    res.status(200).json(
        paginate(req, followees)
    );
};
