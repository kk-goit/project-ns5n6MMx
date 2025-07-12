import express from "express";
import morgan from "morgan";
import cors from "cors";

import profileRoutes from "./routes/profileRoutes.js";
import authRouter from "./routes/authRouter.js";
import followRouter from "./routes/followRouter.js";
import followsRouter from "./routes/follows.js";
import recipeRouter from "./routers/recipeRouter.js";


import "./db/sync.js";

import controllerWrapper from "./decorators/controllerWrapper.js";
import apiRouter from "./routes/apiRouter.js";

import HttpError from "./errors/httpError.js";
import recipesRouter from "./routes/recipesRouter.js";


const app = express();

app.use(morgan("tiny"));
app.use(cors());
app.use(express.json());

app.use("/api/recipes", recipeRouter);

app.use(express.static("public"));
app.use("/api/users", followsRouter);

app.use("/api/profile", profileRoutes);
app.use("/api/recipes", controllerWrapper(recipesRouter));
app.use("/api/auth", authRouter);
app.use("/api/follow", followRouter);
app.use("/api", controllerWrapper(apiRouter));

app.use((_, res) => {
  res.status(404).json({ message: "Route not found" });
});

app.use((err, req, res, next) => {
  if (err instanceof HttpError) {
    return res.status(err.status).json(err);
  }
  const { status = 500, message = "Server error" } = err;
  res.status(status).json({ message });
});

const { PORT = 3000 } = process.env;
const port = Number(PORT);
app.listen(port, () => {
  console.log(`Server is running. Use our API on port: ${port}`);
});
