import Joi from "joi";

export const registrationSchema = Joi.object({
    email: Joi.string().required().email(),
    password: Joi.string().required().min(6),
    name: Joi.string().required().min(2),
}).options({ stripUnknown: true, abortEarly: false });