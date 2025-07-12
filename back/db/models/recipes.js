import {DataTypes} from "sequelize";
import sequelize from "../connection.js";

import {Ingredient} from "./ingredients.js";
import {Category} from "./categories.js";
import {Area} from "./areas.js";
import {User} from "./users.js";

const Recipe = sequelize.define(
    "recipes",
    {
        title: {
            type: DataTypes.STRING(128),
            allowNull: false,
        },
        category_id: {
            type: DataTypes.INTEGER,
            allowNull: false,
            references: {
                model: Category,
                key: "id",
            },
        },
        area_id: {
            type: DataTypes.INTEGER,
            allowNull: false,
            references: {
                model: Area,
                key: "id",
            },
        },
        user_id: {
            type: DataTypes.INTEGER,
            allowNull: false,
            references: {
                model: User,
                key: "id",
            },
        },
        instructions: {
            type: DataTypes.TEXT,
            allowNull: false,
        },
        description: {
            type: DataTypes.STRING(2048),
            allowNull: false,
        },
        time: {
            type: DataTypes.INTEGER,
            allowNull: false,
        },
        thumb: {
            type: DataTypes.STRING(1024),
            allowNull: false,
      validate: { isUrl: true },
            },
        },
  {
    underscored: true,
    timestamps: false,
  },
);

const RecipeIngredient = sequelize.define(
  "recipes_ingredients",
  {
    recipe_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      references: {
        model: Recipe,
        key: "id",
      },
    },
    ingredient_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      references: {
        model: Ingredient,
        key: "id",
      },
    },
    measure: {
      type: DataTypes.STRING(128),
      allowNull: false,
    },
  },
  {
      timestamps: false,
    underscored: true,
  }
);

const RecipeUserFavorite = sequelize.define(
  "users_favorite_recipes",
  {
    recipe_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      references: {
        model: Recipe,
        key: "id",
      },
    },
    user_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      references: {
        model: User,
        key: "id",
      },
    },
  },
  {
    timestamps: false,
  }
);


Recipe.hasMany(RecipeUserFavorite, { foreignKey: "recipe_id", as: "users_favorite_recipes" });
RecipeUserFavorite.belongsTo(Recipe, { foreignKey: "recipe_id", as: "recipe" });
User.hasMany(RecipeUserFavorite, { foreignKey: "user_id", as: "favoriteEntries" });
RecipeUserFavorite.belongsTo(User, { foreignKey: "user_id", as: "user" });


Recipe.belongsTo(User, {foreignKey: "user_id", as: "user"});
User.hasMany(Recipe, { foreignKey: "user_id", as: "recipes" });
Recipe.belongsTo(Category, {foreignKey: "category_id", as: "category"});
Category.hasMany(Recipe, { foreignKey: "category_id", as: "recipes" });
Recipe.belongsTo(Area, {foreignKey: "area_id", as: "area"});
Area.hasMany(Recipe, { foreignKey: "area_id", as: "recipes" });

Recipe.hasMany(RecipeIngredient, {foreignKey: "recipe_id", as: "ingredients"});
Ingredient.hasMany(RecipeIngredient, { foreignKey: "ingredient_id", as: "recipeIngredients" });
RecipeIngredient.belongsTo(Recipe, {foreignKey: "recipe_id", as: "recipe"});
RecipeIngredient.belongsTo(Ingredient, {foreignKey: "ingredient_id", as: "ingredient"})


export { Recipe, RecipeIngredient, RecipeUserFavorite };
