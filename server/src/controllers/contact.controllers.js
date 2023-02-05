const contactServices = require("../services/contact.services");

const getCategories = async (req, res) => {
  const categories = await contactServices.getCategories();
  res.status(200).json({
    message: `retrieved all categories`,
    data: categories
  })
}

const getContacts = async (req, res) => {
  const { userId } = req.params;

  const id = parseInt(userId);

  const contacts = await contactServices.getContacts(id);

  res.status(200).json({
    message: `retrieved all contacts that user ID ${userId} has`,
    data: contacts
  })
};

const createContact = async (req, res) => {
  const {
    relating_user_id,
    related_user_id,
    notes,
    contact_frequency,
    category_id,
    match_id
  } = req.body;

  const contact = await contactServices.createContact(relating_user_id, related_user_id, notes, contact_frequency, category_id, match_id);

  res.status(200).json({
    message: `created a contact for ${relating_user_id} about ${related_user_id}`,
    data: contact,
  });
};

const updateContact = async (req, res) => {
  const {
    id,
    notes,
    contact_frequency,
    category_id
  } = req.body;

  const contact = await contactServices.updateContact(id, notes, contact_frequency, category_id);

  res.status(200).json({
    message: `updated contact with id ${id}`,
    data: contact,
  });
};

const deleteContact = async (req, res) => {
  const { contactId } = req.params;

  const id = parseInt(contactId);

  const contact = await contactServices.deleteContact(id);

  res.status(200).json({
    message: `deleted contact with ID ${contactId}`,
    data: contact
  })
}

module.exports = {
  getCategories,
  createContact,
  getContacts,
  updateContact,
  deleteContact
};
