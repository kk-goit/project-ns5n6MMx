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
            validate: {
                isUrl: true,
            },
        },
    }
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
  }
);

const RecipeUserFaivorite = sequelize.define(
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


Recipe.hasMany(RecipeUserFaivorite, {
  foreignKey: "recipe_id",
  as: "users_favorite_recipes"
});
RecipeUserFaivorite.belongsTo(Recipe, {
  foreignKey: "recipe_id",
  as: "recipe"
});


Recipe.belongsTo(User, {foreignKey: "user_id", as: "user"});
Recipe.belongsTo(Category, {foreignKey: "category_id", as: "category"});
Recipe.belongsTo(Area, {foreignKey: "area_id", as: "area"});

Recipe.hasMany(RecipeIngredient, {foreignKey: "recipe_id", as: "ingredients"});
RecipeIngredient.belongsTo(Recipe, {foreignKey: "recipe_id", as: "recipe"});
RecipeIngredient.belongsTo(Ingredient, {foreignKey: "ingredient_id", as: "ingredient"})


export { Recipe, RecipeIngredient, RecipeUserFaivorite };
