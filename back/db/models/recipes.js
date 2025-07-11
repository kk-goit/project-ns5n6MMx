import { DataTypes } from "sequelize";
import sequelize from "../connection.js";

import { Ingredient } from "./ingredients.js";
import { Category } from "./categories.js";
import { Area } from "./areas.js";
import { User } from "./users.js";

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
    reciep_id: {
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

Recipe.hasMany(RecipeIngredient, {
  foreignKey: 'reciep_id',
  as: 'ingredients',
  onDelete: 'CASCADE',
});
RecipeIngredient.belongsTo(Recipe, {
  foreignKey: 'reciep_id',
  as: 'recipe',
  onDelete: 'CASCADE',
});


export { Recipe, RecipeIngredient };