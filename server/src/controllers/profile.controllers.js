const getAllTags = (req, res) => {
  // fetch all tags including career and hobby

  res.status(200).json({
    message: `fetched all the tags including career and hobby`,
    data: {
      career: [],
      hobby: [],
    },
  });
};

const createProfile = (req, res) => {
  res.status(200).json({
    message: "created profile",
  });
};

const getProfile = (req, res) => {
  res.status(200).json({
    message: "retrieved profile",
    data: {},
  });
};

const updateProfile = (req, res) => {
  res.status(200).json({
    message: "updated profile",
  });
};

const getUser = (req, res) => {
  const { userId } = req.params;

  res.status(200).json({
    message: `retrieved an user with user id: ${userId}`,
    data: {},
  });
};

module.exports = {
  getAllTags,
  createProfile,
  getProfile,
  updateProfile,
  getUser,
};
