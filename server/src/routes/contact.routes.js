const express = require("express");

// import controllers
const contactControllers = require("../controllers/contact.controllers");

const router = express.Router();

router.get("/categories", contactControllers.getCategories);
router.get("/:userId", contactControllers.getContacts);
router.post("/", contactControllers.createContact);
router.put("/", contactControllers.updateContact);
router.delete("/:contactId", contactControllers.deleteContact);

module.exports = router;