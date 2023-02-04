const express = require("express");

// import controllers
const profileControllers = require("../controllers/profile.controllers");

const router = express.Router();

router.get("/tags", profileControllers.getAllTags);

router.put("/me", profileControllers.updateProfile);

router.get("/:userId", profileControllers.getProfile);

module.exports = router;
