import NotFoundError from "../errors/notFoundError.js";
import recipesService from '../services/recipesServices.js';
import { paginateItems } from "../decorators/paginate.js";

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

export const listRecipes = async (req, res) => {
    try {
        const filters = {
            category: req.query.category,
            area: req.query.area,
            ingredients: req.query.ingredients,
            owner: req.query.owner,
        };

        const allRecipes = await recipesService.listRecipes(filters);

        const {
            page,
            limit,
            pages,
            total,
            items: recipes,
        } = paginateItems(req.query.page, req.query.limit, allRecipes);

        res.json({ page, limit, pages, total, recipes });
    } catch (error) {
        console.error("Error listing recipes:", error);
        res.status(500).json({ message: "Failed to load recipes" });
    }

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
