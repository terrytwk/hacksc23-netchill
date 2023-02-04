const matchServices = require("../services/match.services");

const createMatch = async (req, res) => {
  const { user_one_id, user_two_id } = req.body;

  const match = await matchServices.createMatch(user_one_id, user_two_id);

  res.status(200).json({
    message: `created a match between ${user_one_id} and ${user_two_id}`,
    data: match,
  });
};

const getMatches = async (req, res) => {
  const { userId } = req.params;

  const id = parseInt(userId);

  const match = await matchServices.getMatches(id);

  res.status(200).json({
    message: `retrieved matches that ${userId} is a part of`,
    data: match,
  });
};

module.exports = {
  createMatch,
  getMatches
};
