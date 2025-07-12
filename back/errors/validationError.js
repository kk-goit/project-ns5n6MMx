import Joi from "joi";
import HttpError from "./httpError.js";


class ValidationError extends HttpError {
    static fromError(error) {
        if (error instanceof Joi.ValidationError) {
            return new ValidationError(error.message);
        }

        return new ValidationError();
    }

    constructor(message = "Bad Request") {
        super(400, message);
    }
}

export default ValidationError;
