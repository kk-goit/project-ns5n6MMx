import express from "express";
import swaggerUi from 'swagger-ui-express';
import YAML from 'yamljs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const openapiDocument = YAML.load(path.join(__dirname, '..', 'docs', 'openapi.yaml'));
console.log(openapiDocument)

const swaggerRouter = express.Router();
swaggerRouter.use(swaggerUi.serve, swaggerUi.setup(openapiDocument));

export default swaggerRouter;
