const express = require("express");
const logger = require("morgan");

// import routers
const AuthRouter = require("./routes/authentication.routes");
const ProfileRouter = require("./routes/profile.routes");
const DiscoverRouter = require("./routes/discover.routes");
const MatchRouter = require("./routes/match.routes");

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
app.use("/api/v1/discover", DiscoverRouter);
app.use("/api/v1/match", MatchRouter);

const port = process.env.PORT || 5001;

app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});
