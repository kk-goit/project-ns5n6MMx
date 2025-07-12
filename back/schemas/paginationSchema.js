import Joi from "joi";

export const paginationSchema = Joi.object({
    offset: Joi.number().default(0),
    limit: Joi.number().default(25),
});