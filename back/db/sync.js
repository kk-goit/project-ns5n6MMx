import { User, UserFollow } from "./models/users.js";
import { Testimonial } from "./models/testimonials.js";
import { Category } from "./models/categories.js";
import { Area } from "./models/areas.js";
import { Ingredient } from "./models/ingredients.js";
import { Recipe, RecipeIngredient } from "./models/recipes.js";

const syncCondition = { alter: true, force: true };
const doSync = true;
 
if (doSync) { 
  await User.sync(syncCondition);
  await UserFollow.sync(syncCondition);
  await Testimonial.sync(syncCondition);
  await Category.sync(syncCondition);
  await Area.sync(syncCondition);
  await Ingredient.sync(syncCondition);
  await Recipe.sync(syncCondition);
  await RecipeIngredient.sync(syncCondition);
}
