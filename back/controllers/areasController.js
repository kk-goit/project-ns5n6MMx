import areasServices from '../services/areasServices.js';

export const listAreas = async (req, res) => {
    res.json(await areasServices.listAreas());
};