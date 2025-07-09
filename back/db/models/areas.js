import { DataTypes } from "sequelize";
import sequelize from "../connection.js";

const Area = sequelize.define(
  "areas",
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

export { Area };