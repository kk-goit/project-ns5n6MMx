import { } from "dotenv/config"; // For .env variables to work
import { User, UserFollow } from "./models/users.js";
import { Testimonial } from "./models/testimonials.js";
import { Category } from "./models/categories.js";
import { Area } from "./models/areas.js";
import { Ingredient } from "./models/ingredients.js";
import { Recipe, RecipeIngredient, RecipeUserFaivorite } from "./models/recipes.js";

const syncCondition = { alter: true, force: false };
const doSync = process.env.DATABASE_SYNC === "yes"? true : false;
 
if (doSync) { 
  await User.sync(syncCondition);
  await UserFollow.sync(syncCondition);
  await Testimonial.sync(syncCondition);
  await Category.sync(syncCondition);
  await Area.sync(syncCondition);
  await Ingredient.sync(syncCondition);
  await Recipe.sync(syncCondition);
  await RecipeIngredient.sync(syncCondition);
  await RecipeUserFaivorite.sync(syncCondition);
}
