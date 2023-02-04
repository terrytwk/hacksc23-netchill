const express = require("express");

// import controllers
const matchControllers = require("../controllers/match.controllers");

const router = express.Router();

router.post("/matchup", matchControllers.createMatch);

router.get("/:userId", matchControllers.getMatches);

module.exports = router;