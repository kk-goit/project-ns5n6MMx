import express from "express";
import { addRecipeController } from "../controllers/recipeControllers.js";
//import { recipeSchema } from "../schemas/recipeSchemas.js";
//import validateBody from "../helpers/validateBody.js";
//import { auth } from "../middleware/auth.js";

const recipesRouter = express.Router();

//recipesRouter.post("/", auth, validateBody(recipeSchema), addRecipeController);
recipesRouter.post("/", addRecipeController);

export default recipesRouter;
