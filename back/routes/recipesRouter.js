import express from 'express';
import {listRecipes, getRecipeByIdController } from '../controllers/recipesController.js';
import controllerWrapper from '../decorators/controllerWrapper.js';

const recipesRouter = express.Router();

recipesRouter.get('/', controllerWrapper(listRecipes));

recipesRouter.get("/:id", controllerWrapper(getRecipeByIdController));

recipesRouter.use((req, res) => res.status(404).json({ message: "Not found" }));

export default recipesRouter;
