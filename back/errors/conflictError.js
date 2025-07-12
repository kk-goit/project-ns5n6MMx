import HttpError from "./httpError.js";


class ConflictError extends HttpError {
    constructor(message = "Conflict") {
        super(409, message);
    }
}

export default ConflictError;
