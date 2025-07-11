import { Sequelize } from "sequelize";
import {} from "dotenv/config"; // For .env variables to work

console.log(process.env);

const sequelize = new Sequelize({
  dialect: process.env.DATABASE_DIALECT,
  username: process.env.DATABASE_USERNAME,
  password: process.env.DATABASE_PASSWORD,
  host: process.env.DATABASE_HOST,
  database: process.env.DATABASE_NAME,
  port: process.env.DATABASE_PORT,
  dialectOptions: {
    ssl: process.env.DATABASE_SSL == "yes",
  },
});

try {
  await sequelize.authenticate();
  console.log("Database connection successful");
} catch (error) {
  console.log(`Error connection to database ${error}`);
  process.exit(1);
}

export default sequelize;
