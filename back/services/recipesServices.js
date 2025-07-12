import { Recipe } from "../db/models/recipes.js";
import { User } from "../db/models/users.js";
import { Category } from "../db/models/categories.js";
import { Area } from "../db/models/areas.js";
import { RecipeIngredient } from "../db/models/recipes.js";
import { Ingredient } from "../db/models/ingredients.js";

async function listRecipes(filters = {}) {
    const where = {};

    if (filters.category) {
        where.category_id = filters.category;
    }

    if (filters.area) {
        where.area_id = filters.area;
    }

    if (filters.owner) {
        where.user_id = filters.owner;
    }

    let havingIngredients = [];
    if (filters.ingredients) {
        havingIngredients = filters.ingredients
            .split(",")
            .map((id) => id.trim())
            .filter(Boolean);
    }

    const recipes = await Recipe.findAll({
        where,
        include: [
            {
                model: User,
                as: "user",
                attributes: ["id", "name", "avatar"],
            },
            {
                model: Category,
                as: "category",
                attributes: ["id", "name"],
            },
            {
                model: Area,
                as: "area",
                attributes: ["id", "name"],
            },
            {
                model: RecipeIngredient,
                as: "ingredients",
                attributes: ["ingredient_id", "measure"],
                include: [
                    {
                        model: Ingredient,
                        as: "ingredient",
                        attributes: ["id", "name"],
                    },
                ],
            },
        ],
    });

    const filteredRecipes = havingIngredients.length
        ? recipes.filter((r) => {
            const ingredientIds = r.ingredients.map((i) => String(i.ingredient_id));
            return havingIngredients.every((id) => ingredientIds.includes(id));
        })
        : recipes;

    return filteredRecipes.map((r) => ({
        id: r.id,
        title: r.title,
        description: r.description,
        thumb: r.thumb,
        time: r.time,
        owner: r.user
            ? {
                id: r.user.id,
                name: r.user.name,
                avatar: r.user.avatar,
            }
            : null,
        category: r.category
            ? {
                id: r.category.id,
                name: r.category.name,
            }
            : null,
        area: r.area
            ? {
                id: r.area.id,
                name: r.area.name,
            }
            : null,
        ingredients: r.ingredients.map((i) => ({
            id: i.ingredient?.id,
            name: i.ingredient?.name,
            measure: i.measure,
        })),
    }));
}

export default { listRecipes };
