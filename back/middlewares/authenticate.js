import HttpError from '../errors/httpError.js';
import authServices from '../services/authServices.js';

const authenticate = async (req, res, next) => {
  const { authorization = '' } = req.headers;
  const [bearer, token] = authorization.split(' ');

  if (bearer !== 'Bearer' || !token) {
    return next(new HttpError(401, 'Not authorized'));
  }

  try {
    const { id } = authServices.verifyToken(token);
    const user = await authServices.getUserById(id);

    if (!user || !user.token || user.token !== token) {
      return next(new HttpError(401, 'Not authorized'));
    }

    req.user = user;
    next();
  } catch (error) {
    next(new HttpError(401, 'Not authorized'));
  }
};

export default authenticate;

export const tryAuthenticate = async (req, res, next) => {
  const { authorization = '' } = req.headers;
  const [bearer, token] = authorization.split(' ');

  if (bearer !== 'Bearer' || !token) {
    return next();
  }

  const { id } = authServices.verifyToken(token);
  const user = await authServices.getUserById(id);

  if (!user || !user.token || user.token !== token) {
    return next();
  }

  req.user = user;
  next();
};
