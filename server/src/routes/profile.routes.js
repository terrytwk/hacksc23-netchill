const express = require("express");

// import controllers
const profileControllers = require("../controllers/profile.controllers");

const router = express.Router();

router.get("/tags", profileControllers.getAllTags);

module.exports = router;
