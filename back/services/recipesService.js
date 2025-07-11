import { Recipe } from "../db/models/recipes.js"

export const removeRecipe = async (recipeId) => {
    const count = await Recipe.destroy({ where: { id: recipeId } });
    return count > 0;
}