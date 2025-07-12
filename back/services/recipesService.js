import { Recipe } from "../db/models/recipes.js"

export const removeRecipe = async (recipeId) => {
    const count = await Recipe.destroy({ where: { id: recipeId } });
    return count > 0;
}

export const getOwnRecipes = async (userId, offset = 0, limit = 25) => {
    const count = await Recipe.count();
    const page = Math.ceil(offset / limit) + 1;

    return {
        count,
        page,
        data: await Recipe.findAll({ limit, offset })
    };
}
