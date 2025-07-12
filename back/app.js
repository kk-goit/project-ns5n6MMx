import express from "express";
import morgan from "morgan";
import cors from "cors";

import swaggerUi from 'swagger-ui-express';
import YAML from 'yamljs';
import path from 'path';
import { fileURLToPath } from 'url';

import errorsCatcher from "./middlewares/errorsCatcher.js";
import apiRouter from "./routes/apiRouter.js";


import "./db/sync.js";



const app = express();

app.use(morgan("tiny"));
app.use(cors());
app.use(express.json());

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const openapiDocument = YAML.load(path.join(__dirname, 'docs', 'openapi.yaml'));
app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(openapiDocument));


app.use(express.static("public"));
app.use("/api/users", followsRouter);

app.use("/api", apiRouter);

app.use((_, res) => {
  res.status(404).json({ message: "Route not found" });
});

app.use(errorsCatcher);

const { PORT = 3000 } = process.env;
const port = Number(PORT);
app.listen(port, () => {
  console.log(`Server is running. Use our API on port: ${port}`);
});
