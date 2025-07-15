import categoriesServices from '../services/categoriesServices.js';
import {paginate} from "../utils/paginationService.js";

export const listCategories = async (req, res) => {
    let categories = await categoriesServices.listCategories();
    res.json(categories);
};