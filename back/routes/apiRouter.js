import express from 'express';
import recipeRouter from "./recipeRouter.js";
import categoriesRouter from './categoriesRouter.js';
import areasRouter from './areasRouter.js';
import ingredientsRouter from './ingredientsRouter.js';
import testimonialsRouter from './testimonialsRouter.js';
import userRouter from './userRouter.js';

const apiRouter = express.Router();

apiRouter.use('/categories', categoriesRouter);
apiRouter.use('/areas', areasRouter);
apiRouter.use('/ingredients', ingredientsRouter);
apiRouter.use('/testimonials', testimonialsRouter);

apiRouter.use('/users', userRouter);
apiRouter.use('/recipes', recipeRouter);

apiRouter.use((_, res) => res.status(404).json({ message: "Not found" }));

export default apiRouter;
