import * as popularRecipeService from '../services/popularRecipeServices.js';

export const getPopularRecipes = async (req, res) => {
  try {
    const recipes = await popularRecipeService.getPopularRecipes();
    res.json(recipes);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Server error' });
  }
};
