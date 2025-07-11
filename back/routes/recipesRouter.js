import express from "express";
import controllerWrapper from "../decorators/controllerWrapper.js";

import { getRecipeByIdController } from "../controllers/recipesController.js";

const recipesRouter = express.Router();

recipesRouter.use("/:id", controllerWrapper(getRecipeByIdController));

recipesRouter.use((req, res) => res.status(404).json({ message: "Not found" }));

export default recipesRouter;
