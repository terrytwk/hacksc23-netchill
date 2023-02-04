const prisma = require("../config/db");

const updateProfile = async (
  user_id,
  first_name,
  last_name,
  organization,
  position,
  phone,
  work_phone,
  bio
) => {
  const updateProfile = await prisma.user.update({
    where: {
      id: user_id,
    },
    data: {
      first_name,
      last_name,
      organization,
      position,
      phone,
      work_phone,
      bio,
    },
  });

  return updateProfile;
};

const getProfile = async (user_id) => {
  const profile = await prisma.user.findUnique({
    where: {
      id: parseInt(user_id),
    },
  });

  return profile;
};

const getCareerTags = async () => {
  return await prisma.careerTag.findMany({});
};

const getHobbyTags = async () => {
  return await prisma.hobbyTag.findMany({});
};

module.exports = { updateProfile, getProfile, getCareerTags, getHobbyTags };
