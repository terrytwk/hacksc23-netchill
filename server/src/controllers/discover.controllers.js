const discoverServices = require("../services/discover.services");

const getNearby = async (req, res) => {
  const { userId } = req.params;

  const id = parseInt(userId);

  const nearby = await discoverServices.getNearby(id);

  res.status(200).json({
    message: `searched for new common-interest users near user ID ${userId}, found ${nearby.length}`,
    data: nearby,
  });
};

const updateLocation = async (req, res) => {
  const { user_id, latitude, longitude } = req.body;

  const updatedUser = await discoverServices.updateLocation(user_id, latitude, longitude);

  res.status(200).json({
    message: `updated the location for user with ID ${user_id}`,
    data: updatedUser,
  });
};

module.exports = {
  getNearby,
  updateLocation
};
