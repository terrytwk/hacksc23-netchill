const discoverServices = require("../services/discover.services");

const getNearby = async (req, res) => {
  const { userId } = req.params;

  const id = parseInt(userId);

  const nearby = await discoverServices.getNearby(id);

  res.status(200).json({
    message: `searched for nearby users: ${userId}`,
    data: nearby,
  });
};

module.exports = {
  getNearby
};
