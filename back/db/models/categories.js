import { DataTypes } from "sequelize";
import sequelize from "../connection.js";

const Category = sequelize.define(
  "categories",
  {
    name: {
      type: DataTypes.STRING(64),
      allowNull: false,
    },
    img: {
      type: DataTypes.STRING(128),
      allowNull: true,
    },
    desc: {
      type: DataTypes.STRING(256),
      allowNull: true,
    }
  },
  {
    timestamps: false,
  }
);

export { Category };