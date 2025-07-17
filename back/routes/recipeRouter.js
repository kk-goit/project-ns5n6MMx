import express from "express";
import authenticate from "../middlewares/authenticate.js";
import upload from "../middlewares/upload.js";
import { tryAuthenticate } from "../middlewares/authenticate.js";
import { paramsValidationMiddleware, bodyValidationMiddleware, parseBodyJsonFields } from "../middlewares/validationMiddleware.js";
import { recipeIdParam, recipeSchema } from "../schemas/recipeSchemas.js";
import {
  getRecipeByIdController,
  addRecipeController,
  addFavorite,
  removeFavorite,
  listFavorites,
  deleteRecipeControlller,
} from "../controllers/recipeControllers.js";
import { getPopularRecipes } from '../controllers/popularRecipeControllers.js';
import { listMyRecipes, listRecipes } from "../controllers/recipesController.js";

const router = express.Router();

router.get("/", listRecipes);
router.get("/my", authenticate, listMyRecipes);
router.post(
  "/",
  authenticate,
  upload.single("thumb"),
  parseBodyJsonFields(['ingredients']),
  bodyValidationMiddleware(recipeSchema),
  addRecipeController
);
router.get('/popular', tryAuthenticate, getPopularRecipes);
router.get("/favorites", authenticate, listFavorites);
router.post("/:recipeId/favorite", paramsValidationMiddleware(recipeIdParam), authenticate, addFavorite);
router.delete("/:recipeId/favorite", paramsValidationMiddleware(recipeIdParam), authenticate, removeFavorite);
router.get("/:recipeId", paramsValidationMiddleware(recipeIdParam), getRecipeByIdController);
router.delete("/:recipeId", paramsValidationMiddleware(recipeIdParam), authenticate, deleteRecipeControlller);

export default router;
