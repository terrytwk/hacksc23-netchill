const express = require("express");

// import controllers
const authControllers = require("../controllers/authentication.controllers");

const router = express.Router();

router.post("/login", authControllers.login);

module.exports = router;
