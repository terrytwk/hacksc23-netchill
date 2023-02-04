const express = require("express");

// import controllers
const authControllers = require("../controllers/authentication.controllers");

const router = express.Router();

router.post("/signup", authControllers.signup);

router.post("/login", authControllers.login);

module.exports = router;
