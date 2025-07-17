import { processAndSaveAvatar } from "../services/profileService.js";

export const updateAvatar = async (req, res, next) => {
  try {
    const avatarURL = await processAndSaveAvatar(req.file, req.user.id, `${req.protocol}://${req.get('host')}`);
    res.status(200).json({ avatarURL });
  } catch (err) {
    next(err);
  }
};