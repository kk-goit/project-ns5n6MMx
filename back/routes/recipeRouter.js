import express from "express";
import authenticate from "../middlewares/authenticate.js";
import { paramsValidationMiddleware } from "../middlewares/validationMiddleware.js";
import { recipeIdParam } from "../schemas/recipeSchemas.js";
import {
  getAllRecipesController,
  getRecipeByIdController,
  addRecipeController,
  addFavorite,
  removeFavorite,
  listFavorites,
} from "../controllers/recipeControllers.js";
import { getPopularRecipes } from '../controllers/popularRecipeControllers.js';

const router = express.Router();

router.get("/", getAllRecipesController);
router.post("/", authenticate, addRecipeController);
router.get('/popular', getPopularRecipes);
router.get("/favorites", authenticate, listFavorites);
router.post("/:recipeId/favorite", paramsValidationMiddleware(recipeIdParam), authenticate, addFavorite);
router.delete("/:recipeId/favorite", paramsValidationMiddleware(recipeIdParam), authenticate, removeFavorite);
router.get("/:recipeId", paramsValidationMiddleware(recipeIdParam), getRecipeByIdController);

export default router;
