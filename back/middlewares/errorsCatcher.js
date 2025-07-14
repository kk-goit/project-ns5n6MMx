import HttpError from "../errors/httpError.js";

const errorsCatcher = (err, req, res, next) => {
  if (err instanceof HttpError) {
    return res.status(err.status).json(err);
  }
  throw err;
  
  const { status = 500, message = "Server error" } = err;
  res.status(status).json({ message });
};

export default errorsCatcher;
