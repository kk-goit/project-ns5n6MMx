import { Sequelize } from "sequelize";
import { User, UserFollow } from "../db/models/users.js";
import { Recipe } from "../db/models/recipes.js";

// Підписатися на користувача
const followUser = async (followerId, followeeId) => {
    await UserFollow.findOrCreate({
      where: {
        follower_user_id: followerId,
        followee_user_id: followeeId,
      },
    });
};

// Скасувати підписку
// DELETE /api/users/followees/:id
const unfollowUser = async (followerId, followeeId) => {
    const deleted = await UserFollow.destroy({
      where: {
        follower_user_id: followerId,
        followee_user_id: followeeId,
      },
    });

    return deleted !== 0;
};

// Отримати всіх followers (хто підписався на користувача)
const getFollowers = async (userId, currentUserId) => {
    const user = await User.findByPk(userId, {
        include: {
            model: User,
            as: 'followers',
            through: { attributes: [] },
            attributes: [
                'id',
                'name',
                'email',
                'avatar',
                [
                    Sequelize.literal(`(SELECT COUNT(*) FROM recipes WHERE recipes.user_id = "followers"."id")`),
                    'recipeCount',
                ],
                [
                    Sequelize.literal(`(
                        SELECT COUNT(*) > 0 FROM users_follows 
                        WHERE "follower_user_id" = :currentUserId 
                        AND "followee_user_id" = "followers"."id"
                    )`),
                    'isFollowing',
                ],
            ],
            include: {
                model: Recipe,
                as: "recipes",
                attributes: ['id', 'thumb'],
                limit: 4,
                separate: true,
                order: [['id', 'DESC']],
            },
        },
        attributes: ['id', 'name', 'email', 'avatar'],
        replacements: { currentUserId },
    });
    return user.followers;
};

// Отримати всіх followees (на кого підписаний користувач)
const getFollowing = async (userId) => {
        const user = await User.findByPk(userId, {
        include: {
            model: User,
            as: 'followees',
            through: { attributes: [] },
            attributes: [
                'id',
                'name',
                'email',
                'avatar',
                [
                    Sequelize.literal(`(SELECT COUNT(*) FROM recipes WHERE recipes.user_id = "followees"."id")`),
                    'recipeCount',
                ],
            ],
            include: {
                model: Recipe,
                as: "recipes",
                attributes: ['id', 'thumb'],
                limit: 4,
                separate: true,
                order: [['id', 'DESC']],
            },
        },
        attributes: ['id', 'name', 'email', 'avatar'],
    });
    return user.followees;

    const user1 = await User.findByPk(userId, {
      include: {
        model: User,
        as: "followees",
        through: { attributes: [] },
      },
    });

    return user1.followees.map((follower) => ({
        id: follower.id,
        name: follower.name,
        email: follower.email,
        avatar: follower.avatar,
    }));
};

export default { followUser, unfollowUser, getFollowers, getFollowing }