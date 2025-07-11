import express from 'express';
import categoriesRouter from './categoriesRouter.js';
import areasRouter from './areasRouter.js';
import ingredientsRouter from './ingredientsRouter.js';
import testimonialsRouter from './testimonialsRouter.js';
import controllerWrapper from '../decorators/controllerWrapper.js';
import userRouter from './userRouter.js';
import recipesRouter from "./recipesRouter.js";

const apiRouter = express.Router();

apiRouter.use('/categories', controllerWrapper(categoriesRouter));
apiRouter.use('/areas', controllerWrapper(areasRouter));
apiRouter.use('/ingredients', controllerWrapper(ingredientsRouter));
apiRouter.use('/testimonials', controllerWrapper(testimonialsRouter));
apiRouter.use('/users', userRouter);
apiRouter.use('/recipes', controllerWrapper(recipesRouter));

apiRouter.use((req, res) => res.status(404).json({ message: "Not found" }));

export default apiRouter;
