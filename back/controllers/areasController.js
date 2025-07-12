import areasServices from '../services/areasServices.js';
import {paginate} from "../utils/paginationService.js";

export const listAreas = async (req, res) => {
    res.json(paginate(await areasServices.listAreas(), req));
};