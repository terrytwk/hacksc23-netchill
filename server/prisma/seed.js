const { PrismaClient } = require('@prisma/client')
const prisma = new PrismaClient()

const careerTags = [
  "Entrepreneurship",
  "Web development",
  "App development",
  "UI/UX",
  "Cloud",
  "AI",
  "Quant finance",
  "Cybersecurity",
  "Game programmer",
  "IT",
  "Product Management",
]

const hobbyTags = [
  "Photography",
  "Reading",
  "Cooking",
  "Coffee",
  "Hiking",
  "Climbing",
  "Movies",
  "Singing",
  "Gaming",
  "Food discovery",
  "Workout",
  "Sports",
  "Drawing",
  "Hacking",
  "Music",
  "Dancing",
]

const categories = [
  "Professional",
  "Social",
  "Acquaintance"
]

async function clearDatabase() {
  await prisma.contact.deleteMany({})
  await prisma.category.deleteMany({})
  await prisma.userToMatch.deleteMany({})
  await prisma.match.deleteMany({})
  await prisma.userToHobbyTag.deleteMany({})
  await prisma.hobbyTag.deleteMany({})
  await prisma.userToCareerTag.deleteMany({})
  await prisma.careerTag.deleteMany({})
  await prisma.hobbyTag.deleteMany({})
  await prisma.user.deleteMany({})
}

async function setupConstants() {
  await Promise.all(careerTags.map((t) => prisma.careerTag.create({data: {name: t}})))
  await Promise.all(hobbyTags.map((t) => prisma.hobbyTag.create({data: {name: t}})))
  await Promise.all(categories.map((c) => prisma.category.create({data: {description: c}})))
}

async function main() {
  await setupConstants()

  const testUser = await prisma.user.create({
    data: {
      email: "test@test.com",
      password: "password",
    }
  })
  const testUserCareerTags = await prisma.careerTag.findUnique({
    where: {
      name: "Entrepreneurship"
    }
  })
  const testUserHobbyTags = await prisma.hobbyTag.findMany({
    where: {
      OR: [
        { name: "Photography" },
        { name: "Coffee" },
        { name: "Workout" },
        { name: "Hacking" }
      ]
    },
    select: {
      id: true
    }
  })
  await prisma.user.update({
    where: {
      id: testUser.id
    },
    data: {
      career_tags: {
        create: {
          tag_id: testUserCareerTags.id
        }
      },
      hobby_tags: {
        create: testUserHobbyTags.map(h => ({tag_id: h.id}))
      }
    }
  })
  const asdfUserCareerTags = await prisma.careerTag.findMany({
    where: {
      OR: [
        { name: "Game programmer" },
        { name: "Cybersecurity" },
        { name: "IT" },
        { name: "Entrepreneurship" }
      ]
    }
  })
  const asdfUserHobbyTags = await prisma.hobbyTag.findMany({
    where: {
      OR: [
        { name: "Hacking" },
        { name: "Workout" },
        { name: "Gaming" },
        { name: "Music" }
      ]
    }
  })
  const asdfUser = await prisma.user.create({
    data: {
      email: "asdf@test.com",
      password: "asdfasdf",
      career_tags: {
        create: asdfUserCareerTags.map(h => ({tag_id: h.id}))
      },
      hobby_tags: {
        create: asdfUserHobbyTags.map(h => ({tag_id: h.id}))
      }
    }
  })
  await prisma.user.create({
    data: {
      email: "noone@test.com",
      password: "nothing",
    }
  })
  const onlyEntrepreneurUser = await prisma.user.create({
    data: {
      email: "only-entrepreneur@test.com",
      password: "testtest",
      career_tags: {
        create: {
          tag_id: testUserCareerTags.id
        }
      },
    }
  })

  // matching time!
  const match = await prisma.match.create({
    data: {
      users: {
        create: [
          { user_id: testUser.id },
          { user_id: asdfUser.id }
        ]
      }
    }
  })
  const match2 = await prisma.match.create({
    data: {
      users: {
        create: [
          { user_id: testUser.id },
          { user_id: onlyEntrepreneurUser.id }
        ]
      }
    }
  })
  // retrieving matches
  const matchSearch = await prisma.user.findUnique({
    where: {
      id: testUser.id
    },
    select: {
      matches: {
        select: {
          match: { // get the match part of the UserToMatch relation
            select: {
              users: { // get all users associated with the Match
                where: {
                  user_id: {
                    not: testUser.id
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
  })
  // console.log(JSON.stringify(matchSearch, null, 2));
  // console.log(matchSearch.matches.map(m => m.match.users))
  // console.log(matchSearch.matches.map(m => m.match.users[0].user)) // gives all matched users, assuming matches are 1-1

  const socialCtg = await prisma.category.findUnique({
    where: {
      description: "Social"
    }
  })
  const contact1 = await prisma.contact.createMany({
    data: [
      {
        relating_user_id: testUser.id,
        related_user_id: asdfUser.id,
        notes: "A great companion to invite to the next party",
        contact_frequency: "ONE_MONTH",
        category_id: socialCtg.id,
        match_id: match.id
      }
    ]
  })
  const contact2 = await prisma.contact.createMany({
    data: [
      {
        relating_user_id: asdfUser.id,
        related_user_id: testUser.id,
        notes: "First met at HackSC",
        match_id: match.id
      }
    ]
  })
}

main()
  .then(async () => {
    await prisma.$disconnect()
  })
  .catch(async (e) => {
    console.error(e)
    await prisma.$disconnect()
    process.exit(1)
  })