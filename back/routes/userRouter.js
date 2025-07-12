import express from 'express';
import { registrationHandler } from '../controllers/userController.js';
import { bodyValidationMiddleware } from '../middlewares/validationMiddleware.js';
import { registrationSchema } from '../schemas/userSchemas.js';


const userRouter = express.Router()
    .post('/registration', bodyValidationMiddleware(registrationSchema), registrationHandler);

export default userRouter;