const express = require("express");

// import controllers
const discoverControllers = require("../controllers/discover.controllers");

const router = express.Router();

router.get("/:userId", discoverControllers.getNearby);

router.put("/location", discoverControllers.updateLocation);

module.exports = router;