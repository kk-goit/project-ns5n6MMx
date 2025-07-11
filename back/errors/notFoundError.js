import HttpError from "./httpError.js";


class NotFoundError extends HttpError {
    constructor(message = "Not Found") {
        super(404, message);
    }
}

export default NotFoundError;
