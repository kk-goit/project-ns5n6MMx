import express from "express";
import authenticate from "../middlewares/authenticate.js";
import controllerWrapper from "../decorators/controllerWrapper.js";
import {
  getAllRecipesController,
  getRecipeByIdController,
  addRecipeController,
  addFavorite,
  removeFavorite,
  listFavorites,
} from "../controllers/recipeControllers.js";

const router = express.Router();

// ——— Public ———
router.get("/", controllerWrapper(getAllRecipesController));
router.get("/:recipeId", controllerWrapper(getRecipeByIdController));

// ——— Private ———
router.post("/", authenticate, controllerWrapper(addRecipeController));

router.get("/favorites", authenticate, controllerWrapper(listFavorites));
router.post(
  "/:recipeId/favorite",
  authenticate,
  controllerWrapper(addFavorite)
);
router.delete(
  "/:recipeId/favorite",
  authenticate,
  controllerWrapper(removeFavorite)
);

export default router;
