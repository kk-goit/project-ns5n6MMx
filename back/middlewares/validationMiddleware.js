import ValidationError from "../errors/validationError.js";

const validationMiddleware = (schema, objName = 'body', setAfter = true) => {
    const func = (req, _, next) => {
        //console.log(`objName:${objName},data:${req[objName]}`);
        const { value, error } = schema.validate(req[objName]);
        if (error) {
            return next(ValidationError.fromError(error));
        }
        if (setAfter) {
            req[objName] = value;
        }
        next();
    };

    return func;
};

export const bodyValidationMiddleware = (schema) => validationMiddleware(schema, 'body');

export const paramsValidationMiddleware = (schema) => validationMiddleware(schema, 'params');

export const queryValidationMiddleware = (schema) => validationMiddleware(schema, 'query', false);

export const parseBodyJsonFields = (fields) => (req, res, next) => {
  for (const field of fields) {
    if (typeof req.body[field] === 'string') {
      try {
        req.body[field] = JSON.parse(req.body[field]);
      } catch {
        return res.status(400).json({ message: `${field} must be JSON` });
      }
    }
  }
  next();
};
