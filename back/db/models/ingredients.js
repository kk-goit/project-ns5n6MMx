import { DataTypes } from "sequelize";
import sequelize from "../connection.js";

const Ingredient = sequelize.define(
  "ingredients",
  {
    name: {
      type: DataTypes.STRING(128),
      allowNull: false,
    },
    desc: {
      type: DataTypes.TEXT,
      allowNull: false,
    },
    img: {
      type: DataTypes.STRING(1024),
      allowNull: false,
      validate: {
        isUrl: true,
      },
    },
  },
  {
    timestamps: false,
  }
);

export { Ingredient };