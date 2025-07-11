import NotFoundError from "../errors/notFoundError.js";
import * as recipeService from "../services/recipesService.js";

export const removeRecipeHandler = async (req, res) => {
    const result = await recipeService.removeRecipe(req.params.id);
    if (!result) {
        throw new NotFoundError("Recipe not found");
    }
    res.end();
};