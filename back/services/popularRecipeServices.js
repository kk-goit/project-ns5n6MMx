import { Recipe, RecipeUserFavorite } from '../db/models/recipes.js';
import { User } from '../db/models/users.js';
import sequelize from '../db/connection.js';

export const getPopularRecipes = async (userId) => {
  const popularRecipes = await Recipe.findAll({
    attributes: [
      'id', 'title', 'thumb',
      [sequelize.fn('COUNT', sequelize.col('users_favorite_recipes.user_id')), 'favoritesCount'],
      [sequelize.fn('COUNT', sequelize.col('is_favorite_check.user_id')), 'is_my_favorite']
    ],
    include: [
      {
        model: RecipeUserFavorite,
        as: 'users_favorite_recipes',
        attributes: [],
      },
      {
        model: User,
        as: 'user',
        attributes: ['name', 'avatar'],
      },
      {
        model: RecipeUserFavorite,
        as: 'is_favorite_check', 
        attributes: [],
        where: { user_id: userId },
        required: false,
      },
    ],
    group: ['recipes.id', 'user.id'],
    order: [[sequelize.literal('"favoritesCount"'), 'DESC']],
    limit: 10,
    subQuery: false,
  });

  return popularRecipes;
};
