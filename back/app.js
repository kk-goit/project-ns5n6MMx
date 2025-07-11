import express from "express";
import morgan from "morgan";
import cors from "cors";
import authRouter from "./routes/authRouter.js";
import recipeRouter from "./routes/recipeRouter.js";
import apiRouter from "./routes/apiRouter.js";

import controllerWrapper from "./decorators/controllerWrapper.js";
import "./db/sync.js";

const app = express();

app.use(morgan("tiny"));
app.use(cors());
app.use(express.json());
app.use(express.static("public"));

app.use("/api/recipes", recipeRouter);

app.use(express.static("public"));

app.use("/api/auth", authRouter);
app.use("/api", controllerWrapper(apiRouter));

// 404
app.use((_, res) => {
  res.status(404).json({ message: "Route not found" });
});

// error handler
app.use((err, req, res, next) => {
  const { status = 500, message = "Server error" } = err;
  res.status(status).json({ message });
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running. Use our API on port: ${PORT}`);
});
