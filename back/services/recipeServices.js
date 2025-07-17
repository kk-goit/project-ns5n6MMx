import path from "path";
import fs from "fs/promises";
import {
  Recipe,
  RecipeIngredient,
  RecipeUserFavorite,
} from "../db/models/recipes.js";
import { Category } from "../db/models/categories.js";
import { Area } from "../db/models/areas.js";
import { Ingredient } from "../db/models/ingredients.js";
import { User } from "../db/models/users.js";
import HttpError from "../errors/httpError.js";

const thumbsDir = path.resolve("public", "thumbs");

export async function getAllRecipes() {
  return Recipe.findAll({
    include: [
      { model: Category, as: "category" },
      { model: Area, as: "area" },
      {
        model: RecipeIngredient,
        as: "ingredients",
        include: [{ model: Ingredient, as: "ingredient" }],
      },
      { model: User, as: "user", attributes: ["id", "name", "avatar"] },
    ],
  });
}


export async function getRecipeById(recipeId) {
  const recipe = await Recipe.findByPk(recipeId, {
    include: [
      { model: Category, as: "category" },
      { model: Area, as: "area" },
      {
        model: RecipeIngredient,
        as: "ingredients",
        include: [{ model: Ingredient, as: "ingredient" }],
      },
      { model: User, as: "user", attributes: ["id", "name", "avatar"] },
    ],
  });
  if (!recipe) throw new HttpError(404, "Recipe not found");
  return recipe;
}


export async function addRecipe(
  title,
  categoryId,
  areaId,
  instructions,
  description,
  thumb,
  baseURL,
  time,
  ingredients,
  ownerId
) {

  console.log({
    title,
    category_id: categoryId,
    area_id: areaId,
    user_id: ownerId,
    instructions,
    description,
    baseURL,
    time,
  });
  const newRecipe = await Recipe.create({
    title,
    category_id: categoryId,
    area_id: areaId,
    user_id: ownerId,
    instructions,
    description,
    thumb: baseURL,
    time,
  });

  await fs.mkdir(thumbsDir, { recursive: true });
  const thumbFilename = `${newRecipe.id}${path.extname(thumb)}`;
  const thumbURL = `${baseURL}/thumbs/${thumbFilename}`;
  const finalPath = path.join(thumbsDir, thumbFilename)
  try {
    await fs.rename(thumb, finalPath);
  } catch (err) {
    console.log(`path:${thumb}, final:${finalPath}`);
    throw new HttpError(500, "Failed to process avatar image");
  }
  await newRecipe.update({ thumb: thumbURL });

  if (Array.isArray(ingredients)) {
    for (const ing of ingredients) {
      if (!ing?.id) continue;
      await RecipeIngredient.create({
        recipe_id: newRecipe.id,
        ingredient_id: ing.id,
        measure: ing.measure,
      });
    }
  }

  return newRecipe;
}

export async function deleteRecipe(id, userId) {
  const recipe = await Recipe.findByPk(id);
  if (!recipe) throw new HttpError(404, "Recipe not found");
  const thumb = recipe.thumb;

  const deleted = await Recipe.destroy({
    where: { id, user_id: userId },
  })   
  if (!deleted) throw new HttpError(404, "Recipe not found or not yours");

  await fs.rm(path.join(thumbsDir, thumb.split('/').pop()));
}
      
export async function addFavorite(userId, recipeId) {
  const recipe = await Recipe.findByPk(recipeId);
  if (!recipe) throw new HttpError(404, "Recipe not found");

  const [fav, created] = await RecipeUserFavorite.findOrCreate({
    where: { user_id: userId, recipe_id: recipeId },
  });
  if (!created) throw new HttpError(400, "Already in favorites");
  return fav;
}

export async function removeFavorite(userId, recipeId) {
  const deleted = await RecipeUserFavorite.destroy({
    where: { user_id: userId, recipe_id: recipeId },
  });
  if (!deleted) throw new HttpError(404, "Favorite not found");
}

export async function listFavorites(userId) {
  const rows = await RecipeUserFavorite.findAll({
    where: { user_id: userId },
    include: [{ model: Recipe, as: "recipe" }],
  });
  return rows.map((r) => r.recipe);
}
