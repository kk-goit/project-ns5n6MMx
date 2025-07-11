import { Ingredient } from '../db/models/ingredients.js';

async function listIngredients(whereCondition = null) {
    return await Ingredient.findAll({ where: whereCondition, order: [['name', 'ASC']] });
}

export default {
    listIngredients,
};