const prisma = require("../config/db");

const updateProfile = async (
  user_id,
  first_name,
  last_name,
  organization,
  position,
  phone,
  work_phone,
  bio,
  location,
  profile_pic,
  career_tags,
  hobby_tags
) => {
  const updateProfile = prisma.user.update({
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
      location,
      profile_pic,
    },
  });
  const deleteCareerTags = prisma.userToCareerTag.deleteMany({})
  const createCareerTags = prisma.userToCareerTag.createMany({
    data: career_tags.map(tid => ({ user_id, tag_id: tid }))
  })
  const deleteHobbyTags = prisma.userToHobbyTag.deleteMany({})
  const createHobbyTags = prisma.userToHobbyTag.createMany({
    data: hobby_tags.map(tid => ({ user_id, tag_id: tid }))
  })
  const [profile, ..._] = await prisma.$transaction([
    updateProfile,
    deleteCareerTags,
    createCareerTags,
    deleteHobbyTags,
    createHobbyTags
  ])

  return profile;
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
