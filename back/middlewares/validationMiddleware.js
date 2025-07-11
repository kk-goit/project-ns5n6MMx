import ValidationError from "../errors/validationError.js";

const validationMiddleware = (schema, objName = 'body') => {
    const func = (req, _, next) => {
        const { value, error } = schema.validate(req[objName]);
        if (error) {
            return next(ValidationError.fromError(error));
        }
        req[objName] = value;
        next();
    };

    return func;
};

export const bodyValidationMiddleware = (schema) => validationMiddleware(schema, 'body');

export const paramsValidationMiddleware = (schema) => validationMiddleware(schema, 'params');


