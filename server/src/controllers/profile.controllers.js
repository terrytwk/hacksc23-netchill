const profileServices = require("../services/profile.services");

const getAllTags = async (req, res) => {
  const careerTags = await profileServices.getCareerTags();
  const hobbyTags = await profileServices.getHobbyTags();

  res.status(200).json({
    message: `fetched all the tags including career and hobby`,
    data: {
      career: careerTags,
      hobby: hobbyTags,
    },
  });
};

const updateProfile = async (req, res) => {
  const {
    user_id,
    first_name,
    last_name,
    organization,
    position,
    phone,
    work_phone,
    bio,
  } = req.body;

  const updatedProfile = profileServices.updateProfile(
    user_id,
    first_name,
    last_name,
    organization,
    position,
    phone,
    work_phone,
    bio
  );

  res.status(200).json({
    message: "updated profile",
  });
};

// also retrieves career and hobby tags
const getProfile = async (req, res) => {
  const { userId } = req.params;

  const userProfile = await profileServices.getProfile(userId);

  res.status(200).json({
    message: `retrieved an user with user id: ${userId}`,
    data: userProfile,
  });
};

module.exports = {
  getAllTags,
  updateProfile,
  getProfile,
};
