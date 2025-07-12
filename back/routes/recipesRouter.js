import express from 'express';
import controllerWrapper from '../decorators/controllerWrapper.js';
import { removeRecipeHandler, listRecipes, getRecipeByIdController } from '../controllers/recipesController.js';
import { paramsValidationMiddleware } from '../middlewares/validationMiddleware.js';
import { paramsIdSchema } from '../schemas/paramsIdSchema.js';
import { getOwnRecipesHandler } from '../controllers/recipesController.js';
import { paginationSchema } from '../schemas/paginationSchema.js';
import { queryValidationMiddleware } from '../middlewares/validationMiddleware.js';

const recipesRouter = express.Router()
    .delete('/:id', paramsValidationMiddleware(paramsIdSchema), removeRecipeHandler)
    .get('/own',
        queryValidationMiddleware(paginationSchema),
        // TODO: need to add auth middleware
        getOwnRecipesHandler
    );

recipesRouter.get('/', controllerWrapper(listRecipes));

recipesRouter.get("/:id", controllerWrapper(getRecipeByIdController));

recipesRouter.use((req, res) => res.status(404).json({ message: "Not found" }));

export default recipesRouter;
