const express = require("express");
const logger = require("morgan");

const app = express();
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use(logger("combined"));

app.get("/", (req, res) => {
  res.status(200).json({
    body: "server working",
  });
});

const port = process.env.PORT || 5001;

app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});
