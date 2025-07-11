import { processAndSaveAvatar } from "../services/avatarService.js";

export const updateAvatar = async (req, res, next) => {
  try {
    const avatarURL = await processAndSaveAvatar(req.file, req.user.id);
    res.status(200).json({ avatarURL });
  } catch (err) {
    next(err);
  }
};