import ValidationError from "../errors/validationError.js";

const validationMiddleware = (schema) => {
    const func = (req, _, next) => {
        const { value, error } = schema.validate(req.body);
        if (error) {
            return next(ValidationError.fromError(error));
        }
        req.body = value;
        next();
    };

    return func;
};

export default validationMiddleware;
