import recipesService from '../services/recipesServices.js';
import { paginateItems } from "../decorators/paginate.js";

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
};
