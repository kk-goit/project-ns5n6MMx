import { Recipe, RecipeUserFaivorite } from '../db/models/recipes.js';
import sequelize from '../db/connection.js';

export const getPopularRecipes = async () => {
  const popularRecipes = await Recipe.findAll({
    attributes: {
      include: [
        [
          sequelize.fn(
            'COUNT',
            sequelize.col('users_favorite_recipes.user_id')
          ),
          'favoritesCount',
        ],
      ],
    },
    include: [
      {
        model: RecipeUserFaivorite,
        as: 'users_favorite_recipes',
        attributes: [],
      },
    ],
    group: ['recipes.id'],
    order: [[sequelize.literal('favoritesCount'), 'DESC']],
    limit: 10,
  });

  return popularRecipes;
};
