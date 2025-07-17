import {
  getAllRecipes,
  getRecipeById,
  addRecipe as _addRecipe,
  addFavorite as _addFavorite,
  removeFavorite as _removeFavorite,
  listFavorites as _listFavorites,
} from "../services/recipeServices.js";
import { Category } from "../db/models/categories.js";
import { Area } from "../db/models/areas.js";
import HttpError from "../errors/httpError.js";
import { paginate } from "../utils/paginationService.js";

// ——— READ Controllers ———
export const getAllRecipesController = async (req, res, next) => {
  try {
    const recipes = await getAllRecipes();
    res.json(recipes);
  } catch (err) {
    next(err);
  }
};

export const getRecipeByIdController = async (req, res, next) => {
  try {
    const id = Number(req.params.recipeId);
    const recipe = await getRecipeById(id);
    res.json(recipe);
  } catch (err) {
    next(err);
  }
};

// ——— CREATE/UPDATE Controllers ———
export async function addRecipeController(req, res, next) {
  try {
    const {
      title,
      category,
      area,
      instructions,
      description,
      thumb,
      time,
      ingredients,
    } = req.body;
    const ownerId = req.user.id;
    const categoryObj = await Category.findOne({ where: { name: category } });
    const areaObj = await Area.findOne({ where: { name: area } });
    if (!categoryObj || !areaObj) {
      throw new HttpError(400, "Invalid category or area");
    }
    const newRecipe = await _addRecipe(
      title,
      categoryObj,
      areaObj,
      instructions,
      description,
      thumb,
      time,
      ingredients,
      ownerId
    );
    res.status(201).json(newRecipe);
  } catch (err) {
    next(err);
  }
}

export const addFavorite = async (req, res, next) => {
  try {
    const userId = req.user.id;
    const recipeId = Number(req.params.recipeId);
    await _addFavorite(userId, recipeId);
    res.status(201).json({ message: "Added to favorites" });
  } catch (err) {
    next(err);
  }
};

export const removeFavorite = async (req, res, next) => {
  try {
    const userId = req.user.id;
    const recipeId = Number(req.params.recipeId);
    await _removeFavorite(userId, recipeId);
    res.status(204).end();
  } catch (err) {
    next(err);
  }
};

export const listFavorites = async (req, res) => {
    const userId = req.user.id;
    const favs = await _listFavorites(userId);
    res.json(paginate(req, favs));
};
