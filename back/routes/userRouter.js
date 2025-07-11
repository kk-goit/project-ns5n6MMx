import express from 'express';
import { registrationHandler } from '../controllers/userController.js';
import validationMiddleware from '../middlewares/validationMiddleware.js';
import { registrationSchema } from '../schemas/userSchemas.js';


const userRouter = express.Router()
    .post('/registration', validationMiddleware(registrationSchema), registrationHandler);

export default userRouter;