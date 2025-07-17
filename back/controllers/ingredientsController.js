import ingredientsServices from '../services/ingredientsServices.js';
import {paginate} from "../utils/paginationService.js";

export const listIngredients = async (req, res) => {
    res.json(await ingredientsServices.listIngredients());
};