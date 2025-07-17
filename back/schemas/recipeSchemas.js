import Joi from "joi";

export const recipeSchema = Joi.object({
  title: Joi.string().min(1).required().messages({
    "string.empty": `"title" can't be empty`,
    "any.required": `"title" is required`,
  }),
  category: Joi.number().min(1).required().messages({
    "any.required": `"category" is required`,
  }),
  area: Joi.number().min(1).required().messages({
    "any.required": `"area" is required`,
  }),
  instructions: Joi.string().min(1).required().messages({
    "string.empty": `"instructions" can't be empty`,
    "any.required": `"instructions" is required`,
  }),
  description: Joi.string().min(1).required().messages({
    "string.empty": `"description" can't be empty`,
    "any.required": `"description" is required`,
  }),
  time: Joi.string().pattern(/^\d+$/).required().messages({
    "string.pattern.base": `"time" must be a number (in minutes)`,
    "any.required": `"time" is required`,
  }),
  ingredients: Joi.array()
    .items(
      Joi.object({
        id: Joi.number().min(1).required().messages({
          "any.required": `"ingredient id" is required`,
        }),
        measure: Joi.string().min(1).required().messages({
          "string.empty": `"measure" can't be empty`,
          "any.required": `"measure" is required`,
        }),
      })
    )
    .min(1)
    .required()
    .messages({
      "array.min": `"ingredients" must have at least one item`,
      "any.required": `"ingredients" is required`,
    }),
});

export const recipeIdParam = Joi.object({
  recipeId: Joi.number().required(),
})