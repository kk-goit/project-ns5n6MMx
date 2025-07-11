import express from 'express';
import { removeRecipeHandler } from '../controllers/recipesController.js';
import { paramsValidationMiddleware } from '../middlewares/validationMiddleware.js';
import { paramsIdSchema } from '../schemas/paramsIdSchema.js';


const recipesRouter = express.Router()
    .delete('/:id', paramsValidationMiddleware(paramsIdSchema), removeRecipeHandler);

export default recipesRouter;