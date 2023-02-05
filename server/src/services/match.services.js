const prisma = require("../config/db");

const createMatch = async (
  user_one_id,
  user_two_id
) => {
  const match = await prisma.match.create({
    data: {
      users: {
        create: [
          { user_id: user_one_id },
          { user_id: user_two_id }
        ]
      }
    }
  })

  return match;
};

const getMatches = async (id) => {
  return await prisma.user.findUnique({
    where: {
      id
    },
    select: {
      matches: {
        select: {
          match: {
            select: {
              id: true,
              users: {
                where: {
                  user_id: {
                    not: id
                  }
                },
                select: {
                  user: true
                }
              }
            }
          }
        }
      }
    }
  }).then(matchSearch => matchSearch.matches.map(m => ({id: m.match.id, user: m.match.users[0].user})))
}

module.exports = { createMatch, getMatches };
