import { Category } from "../db/models/categories.js";
import { Area } from "../db/models/areas.js";
import { addRecipe } from "../services/recipeServices.js";

export async function addRecipeController(req, res) {
  try {
    const {
      title,
      category,
      area,
      instructions,
      description,
      thumb,
      time,
      ingredients,
      ownerId,
    } = req.body;

    const categoryObj = await Category.findOne({ where: { name: category } });
    const areaObj = await Area.findOne({ where: { name: area } });

    if (!categoryObj || !areaObj) {
      return res.status(400).json({ message: "Invalid category or area" });
    }

    const newRecipe = await addRecipe(
      title,
      categoryObj,
      areaObj,
      instructions,
      description,
      thumb,
      time,
      ingredients,
      ownerId
    );

    res.status(201).json(newRecipe);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: error.message });
  }
}
