import recipesService from "../services/recipesServices.js";
import { paginate } from "../utils/paginationService.js";

export const listRecipes = async (req, res) => {
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
    } = paginate(allRecipes, req);

    res.json({ page, limit, pages, total, recipes });
};

export const listMyRecipes = async (req, res) => {
  const allRecipes = await recipesService.listRecipes({ owner: req.user.id });

    const {
      page,
      limit,
      pages,
      total,
      items: recipes,
    } = paginate(allRecipes, req);

    res.json({ page, limit, pages, total, recipes });
};

