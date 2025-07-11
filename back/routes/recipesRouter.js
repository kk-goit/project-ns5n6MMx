import express from 'express';
import {listRecipes } from '../controllers/recipesController.js';
import controllerWrapper from '../decorators/controllerWrapper.js';

const recipesRouter = express.Router();

recipesRouter.get('/', controllerWrapper(listRecipes));


export default recipesRouter;