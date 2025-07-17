import {
  getAllRecipes,
  getRecipeById,
  addRecipe as _addRecipe,
  addFavorite as _addFavorite,
  removeFavorite as _removeFavorite,
  listFavorites as _listFavorites,
  deleteRecipe,
} from "../services/recipeServices.js";
import { Category } from "../db/models/categories.js";
import { Area } from "../db/models/areas.js";
import HttpError from "../errors/httpError.js";
import { paginate } from "../utils/paginationService.js";

// ——— READ Controllers ———
export const getAllRecipesController = async (req, res, next) => {
    const recipes = await getAllRecipes();
    res.json(recipes);
};

export const getRecipeByIdController = async (req, res, next) => {
    const id = Number(req.params.recipeId);
    const recipe = await getRecipeById(id);
    res.json(recipe);
};

// ——— CREATE/UPDATE Controllers ———
export async function addRecipeController(req, res) {
    const {
      title,
      category,
      area,
      instructions,
      description,
      time,
      ingredients,
    } = req.body;
    const ownerId = req.user.id;

    if (!await Category.findByPk(category)) {
      throw new HttpError(400, "Invalid category");
    }
    if (!await Area.findByPk(area)) {
      throw new HttpError(400, "Invalid area");
    }
        
    const newRecipe = await _addRecipe(
      title,
      category,
      area,
      instructions,
      description,
      req.file.path,
      `${req.protocol}://${req.get('host')}`,
      time,
      ingredients,
      ownerId
    );
    res.status(201).json(await getRecipeById(newRecipe.id));
}

export async function deleteRecipeControlller(req, res) {
  const id = Number(req.params.recipeId);
  await deleteRecipe(id, req.user.id);
  res.status(204).end();
}

export const addFavorite = async (req, res, next) => {
    const userId = req.user.id;
    const recipeId = Number(req.params.recipeId);
    await _addFavorite(userId, recipeId);
    res.status(201).json({ message: "Added to favorites" });
};

export const removeFavorite = async (req, res, next) => {
    const userId = req.user.id;
    const recipeId = Number(req.params.recipeId);
    await _removeFavorite(userId, recipeId);
    res.status(204).end();
};

export const listFavorites = async (req, res) => {
    const userId = req.user.id;
    const favs = await _listFavorites(userId);
    res.json(paginate(req, favs));
};
