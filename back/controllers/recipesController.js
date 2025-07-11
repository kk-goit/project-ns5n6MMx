import NotFoundError from "../errors/notFoundError.js";
import * as recipeService from "../services/recipesService.js";

export const getOwnRecipesHandler = async (req, res) => {
    res.json(
        await recipeService.getOwnRecipes(req.user.id, req.query.offset, req.query.limit)
    );
};

export const removeRecipeHandler = async (req, res) => {
    const result = await recipeService.removeRecipe(req.params.id);
    if (!result) {
        throw new NotFoundError("Recipe not found");
    }
    res.end();
};