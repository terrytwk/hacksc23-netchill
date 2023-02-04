const prisma = require("../config/db");

// summary: find users that are nearby, AND either they have a matching career tag or matching hobby tag
const getNearby = async (id) => {
  // retrieve user location and interests
  const userDetails = await prisma.user.findUnique({
    where: {
      id
    },
    select: {
      latitude: true,
      longitude: true,
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
    },
  })
  // find all users that are nearby
  const allUsers = await prisma.user.findMany({
    where: {
      NOT: {
        id
      }
    },
    select: {
      id: true,
      latitude: true,
      longitude: true
    }
  })
  // filter out far users
  const nearbyUsers = allUsers // TODO: implement distance filter
  // get the user interests
  const interestingUsers = await prisma.user.findMany({
    where: {
      AND: [
        {
          OR: nearbyUsers.map(u => ({id:u.id})), // find nearby users who
        },
        {
          OR: [
            {
              career_tags: {
                some: {
                  // have at least one career tag that is in user's career tags
                  tag_id: {
                    in: userDetails.career_tags.map(ct => ct.tag.id)
                  }
                }
              }
            }, // or...
            {
              hobby_tags: {
                some: {
                  // have at least one hobby tag that is in user's hobby tags
                  tag_id: {
                    in: userDetails.hobby_tags.map(ct => ct.tag.id)
                  }
                }
              }
            },
          ]
        }
      ]
    },
    select: {
      id: true,
      career_tags: {
        where: {
          tag_id: {
            in: userDetails.career_tags.map(ct => ct.tag.id)
          }
        },
        select: {
          tag: true
        }
      },
      hobby_tags: {
        where: {
          tag_id: {
            in: userDetails.hobby_tags.map(ct => ct.tag.id)
          }
        },
        select: {
          tag: true
        }
      }
    }
  })
  return interestingUsers
}

module.exports = { getNearby };