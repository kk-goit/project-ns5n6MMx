import express from "express";
import morgan from "morgan";
import cors from "cors";

import "./db/sync.js";
import followsRouter from "./routes/follows.js";
import controllerWrapper from "./decorators/controllerWrapper.js";
import apiRouter from "./routes/apiRouter.js";

const app = express();

app.use(morgan("tiny"));
app.use(cors());
app.use(express.json());
app.use(express.static("public"));
app.use("/api/users", followsRouter);

app.use('/api', controllerWrapper(apiRouter));

app.use((_, res) => {
  res.status(404).json({ message: "Route not found" });
});

app.use((err, req, res, next) => {
  const { status = 500, message = "Server error" } = err;
  res.status(status).json({ message });
});

const { PORT = 3000 } = process.env;
const port = Number(PORT);
app.listen(port, () => {
  console.log(`Server is running. Use our API on port: ${port}`);
});
