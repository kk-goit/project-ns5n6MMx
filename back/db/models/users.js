import { DataTypes } from "sequelize";
import sequelize from "../connection.js";

const User = sequelize.define(
  'users',
  {
    email: {
      type: DataTypes.STRING(128),
      allowNull: false,
      unique: true,
      validate: {
        isEmail: true,
      },
    },
    name: {
      type: DataTypes.STRING(256),
      allowNull: false,
    },
    password: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    avatar: {
      type: DataTypes.STRING(1024),
      allowNull: false,
      validate: {
        isUrl: true,
      },
    },
    token: {
      type: DataTypes.STRING,
      defaultValue: null,
    },
  },
);

const UserFollow = sequelize.define(
  'users_follows',
  {
    follower_user_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      references: {
        model: User,
        key: 'id',
      }
    },
    followee_user_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      references: {
        model: User,
        key: 'id',
      }
    },
  },
  {
    timestamps: false,
  }
);

User.belongsToMany(
  User,
  {
    through: UserFollow,
    as: 'followers',
    foreignKey: 'follower_user_id',
    otherKey: 'followee_user_id'
  }
);
User.belongsToMany(
  User,
  {
    through: UserFollow,
    as: 'followees',
    foreignKey: 'followee_user_id',
    otherKey: 'follower_user_id'
  }
);

export { User, UserFollow };
