import * as userService from "../services/userService.js";

export const registrationHandler = async (req, res) => {
    res.json(
        await userService.registration(req.body)
    );
};