import express from "express";
import morgan from "morgan";
import cors from "cors";

import errorsCatcher from "./middlewares/errorsCatcher.js";
import apiRouter from "./routes/apiRouter.js";
import swaggerRouter from "./routes/swaggerRouter.js";

import "./db/sync.js";

const app = express();

app.use(morgan("tiny"));
app.use(cors());
app.use(express.json());
app.use(express.static("public"));

app.use("/api", apiRouter);
app.use('/api-docs', swaggerRouter);

app.use(errorsCatcher);
app.use((_, res) => {
  res.status(404).json({ message: "Route not found" });
});

const { PORT = 3000 } = process.env;
const port = Number(PORT);
app.listen(port, () => {
  console.log(`Server is running. Use our API on port: ${port}`);
});
