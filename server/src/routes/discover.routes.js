const express = require("express");

// import controllers
const discoverControllers = require("../controllers/discover.controllers");

const router = express.Router();

router.get("/nearby/:userId", discoverControllers.getNearby);

module.exports = router;