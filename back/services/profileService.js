import path from "path";
import fs from "fs/promises";
import HttpError from "../errors/httpError.js";
import { User } from "../db/models/users.js";

const avatarsDir = path.resolve("public", "avatars");

export const processAndSaveAvatar = async (file, userId, baseURL) => {
  if (!file) {
    throw new HttpError(400, "Avatar file is required");
  }

  await fs.mkdir(avatarsDir, { recursive: true });

  const ext = path.extname(file.originalname);
  const fileName = `${userId}${ext}`;
  const finalPath = path.join(avatarsDir, fileName);

  try {
    await fs.rename(file.path, finalPath);
  } catch (err) {
    throw new HttpError(500, "Failed to process avatar image");
  }

  const avatar = `${baseURL}/avatars/${fileName}`;

  try {
    await User.update({ avatar }, { where: {id: userId} });
  } catch (err) {
    throw new HttpError(500, "Failed to update avatarURL in database");
  }

  return avatar;
};