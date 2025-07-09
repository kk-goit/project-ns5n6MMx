import { DataTypes } from "sequelize";
import sequelize from "../connection.js";

const Category = sequelize.define(
  "categories",
  {
    name: {
      type: DataTypes.STRING(64),
      allowNull: false,
    },
  },
  {
    timestamps: false,
  }
);

export { Category };