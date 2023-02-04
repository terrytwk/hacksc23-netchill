const express = require("express");
const logger = require("morgan");

// import routers
const AuthRouter = require("./routes/authentication.routes");
const ProfileRouter = require("./routes/profile.routes");

const app = express();
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use(logger("combined"));

app.get("/", (req, res) => {
  res.status(200).json({
    body: "server working",
  });
});

// use routers
app.use("/api/v1/auth", AuthRouter);
app.use("/api/v1/profile", ProfileRouter);

const port = process.env.PORT || 5001;

app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});
