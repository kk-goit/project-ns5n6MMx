import { Recipe, RecipeIngredient } from "../db/models/recipes.js";

export async function addRecipe(
  title,
  categoryObj,
  areaObj,
  instructions,
  description,
  thumb,
  time,
  ingredients,
  ownerId
) {
  const newRecipe = await Recipe.create({
    title,
    category_id: categoryObj.id,
    area_id: areaObj.id,
    user_id: ownerId,
    instructions,
    description,
    thumb,
    time,
  });

  if (Array.isArray(ingredients)) {
    for (const ingredient of ingredients) {
      if (!ingredient || !ingredient.id) {
        continue;
      }
      await RecipeIngredient.create({
        reciep_id: newRecipe.id,
        ingredient_id: ingredient.id,
        measure: ingredient.measure,
      });
    }
  }

  return newRecipe;
}
