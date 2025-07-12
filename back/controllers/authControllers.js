import bcrypt from "bcryptjs";
import gravatar from "gravatar";
import authService from "../services/authServices.js";
import HttpError from "../errors/httpError.js";

export const register = async (req, res, next) => {
  try {
    const { name, email, password } = req.body;

    const existingUser = await authService.getUserByEmail(email);

    if (existingUser) {
      throw new HttpError(409, "Email in use");
    }

    const hashedPassword = await bcrypt.hash(password, 10);
    let avatar = gravatar.url(email, {
      s: "250",
      r: "pg",
      d: "identicon",
    });

    if (!avatar) {
      avatar =
        "https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mp";
    }

    if (avatar[0] === "/") {
      avatar = "https:" + avatar;
    }

    const user = await authService.createUser(
      name,
      email,
      hashedPassword,
      avatar
    );

    res.status(201).json({
      user: {
        name: user.name,
        email: user.email,
        avatar: user.avatar,
      },
    });
  } catch (error) {
    next(error);
  }
};

export const login = async (req, res, next) => {
  try {
    const { email, password } = req.body;

    const user = await authService.getUserByEmail(email);

    if (!user) {
      throw new HttpError(401, "Email or password is wrong");
    }

    const passwordCompare = await bcrypt.compare(password, user.password);

    if (!passwordCompare) {
      throw new HttpError(401, "Email or password is wrong");
    }

    const token = authService.generateToken(user.id);
    const result = await authService.updateUserToken(user.id, token);

    if (!result) {
      throw new HttpError(401, "Email or password is wrong");
    }

    res.json({
      token,
      user: {
        name: user.name,
        email: user.email,
        avatar: user.avatar,
      },
    });
  } catch (error) {
    next(error);
  }
};

export const logout = async (req, res, next) => {
  try {
    await authService.updateUserToken(req.user.id, null);
    res.status(204).end();
  } catch (error) {
    next(error);
  }
};

export const getCurrent = async (req, res, next) => {
  try {
    res.json({
      name: req.user.name,
      email: req.user.email,
      avatar: req.user.avatar,
    });
  } catch (error) {
    next(error);
  }
};

export const getUserById = async (req, res, next) => {
  const user = await authService.getUserById(req.params.id);
  if (user)
    res.json({
      name: user.name,
      avatar: user.avatar,
    });
  else next(new HttpError(404, "Not found"));
}
