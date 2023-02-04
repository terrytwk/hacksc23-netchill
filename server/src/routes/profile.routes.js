const { Router } = require("express");
const express = require("express");

// import controllers
const profileControllers = require("../controllers/profile.controllers");

const router = express.Router();

router.get("/tags", profileControllers.getAllTags);

router.post("/me", profileControllers.createProfile);
router.get("/me", profileControllers.getProfile);
router.put("/me", profileControllers.updateProfile);

router.get("/:userId", profileControllers.getUser);

module.exports = router;
