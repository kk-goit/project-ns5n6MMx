import * as recipesService from "../services/resipesServices.js";

export const getRecipeByIdController = async (req, res, next) => {
  const { id } = req.params;
  const { recipe, ingredients } = await recipesService.getRecipeByIdService(id);
  const updateIngredients = [];
  ingredients.map((ing) =>
    updateIngredients.push({
      name: ing.ingredient.name,
      measure: ing.measure,
      image: ing.ingredient.img,
    })
  );

  if (!recipe) {
    return next(HttpError(404, " `Recipe with id=${id} not found`"));
  }
  res.json({
    id: recipe.id,
    title: recipe.title,
    category: recipe.category_id,
    time: recipe.time,
    description: recipe.description,
    owner: recipe.user_id,
    ingredients: updateIngredients,
    area: recipe.area_id,
    instructions: recipe.instructions,
    thumb: recipe.thumb,
  });
};

export default {
  getRecipeByIdController,
};
