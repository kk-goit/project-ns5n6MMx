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
      type: DataTypes.STRING(1024),
      allowNull: true,
      validate: {
        isUrl: true,
      }
    },
    desc: {
      type: DataTypes.STRING(4096),
      allowNull: true,
    }
  },
  {
    timestamps: false,
  }
);

export { Category };