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
    include: {
      career_tags: {
        select: {
          tag: true
        }
      },
      hobby_tags: {
        select: {
          tag: true
        }
      }
    }
  });

  return profile;
};

const getCareerTags = async () => {
  return await prisma.careerTag.findMany({});
};

const getHobbyTags = async () => {
  return await prisma.hobbyTag.findMany({});
};

const getUserCareerTags = async (id) => {
  return await prisma.user.findUnique({
    where: {
      id
    },
    select: {
      career_tags: {
        select: {
          tag: true
        }
      }
    }
  })
}

const getUserHobbyTags = async (id) => {
  return await prisma.user.findUnique({
    where: {
      id
    },
    select: {
      hobby_tags: {
        select: {
          tag: true
        }
      }
    }
  })
}

module.exports = { updateProfile, getProfile, getCareerTags, getHobbyTags, getUserCareerTags, getUserHobbyTags };
