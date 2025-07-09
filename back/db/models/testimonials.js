import { DataTypes } from "sequelize";
import sequelize from "../connection.js";

import { User } from "./users.js";

const Testimonial = sequelize.define(
  "testimonials",
  {
    user_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: User,
        key: "id",
      },
    },
    testimonial: {
      type: DataTypes.STRING(512),
      allowNull: false,
    },
  },
  {
    timestamps: false,
  }
);

export { Testimonial };