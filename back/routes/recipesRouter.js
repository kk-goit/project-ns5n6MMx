import express from 'express';
import { removeRecipeHandler } from '../controllers/recipesController.js';
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

export default recipesRouter;