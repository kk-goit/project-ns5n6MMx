import { Recipe, RecipeIngredient } from "../db/models/recipes.js";

import { Ingredient } from "../db/models/ingredients.js";
export const getRecipeByIdService = async (id) => {
  const recipe = await Recipe.findByPk(id);
  const ingredients = await RecipeIngredient.findAll({
    where: { reciep_id: id },
    include: [
      {
        model: Ingredient,
        as: "ingredient",
        attributes: ["id", "name", "img"],
      },
    ],
  });

  return { recipe, ingredients };
};
