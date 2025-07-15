import * as popularRecipeService from '../services/popularRecipeServices.js';

export const getPopularRecipes = async (req, res) => {
  try {
    const userId = (req.user) ? req.user.id : -1;
    const recipes = await popularRecipeService.getPopularRecipes(userId);
    res.json(recipes);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Server error' });
  }
};
