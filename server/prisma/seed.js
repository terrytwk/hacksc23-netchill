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
  "Game",
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

async function main() {
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
  const testUser = await prisma.user.create({
    data: {
      email: "test@test.com",
      password: "password",
    }
  })
  const asdfUser = await prisma.user.create({
    data: {
      email: "asdf@test.com",
      password: "asdfasdf",
    }
  })
  await Promise.all(careerTags.map((t) =>
     prisma.careerTag.create({
      data: {
        name: t
      }
    })
  ))
  await Promise.all(hobbyTags.map((t) =>
     prisma.hobbyTag.create({
      data: {
        name: t
      }
    })
  ))
  await Promise.all(categories.map((c) =>
     prisma.category.create({
      data: {
        description: c
      }
    })
  ))
  const entrprnrshpTag = await prisma.careerTag.findUnique({
    where: {
      name: "Entrepreneurship"
    }
  })
  const hTags = await prisma.hobbyTag.findMany({
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
          tag_id: entrprnrshpTag.id
        }
      },
      hobby_tags: {
        create: hTags.map(h => ({tag_id: h.id}))
      }
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
  const matches = await prisma.user.findUnique({
    where: {
      id: testUser.id
    },
    select: {
      matches: {
        select: {
          match: {
            select: {
              users: {
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
  console.log(JSON.stringify(matches, null, 2));
  console.log(matches.matches.map(m => m.match.users))
  console.log(matches.matches.map(m => m.match.users[0].user)) // gives all matched users, assuming matches are 1-1

  const socialCtg = await prisma.category.findUnique({
    where: {
      description: "Social"
    }
  })
  const contact1 = await prisma.contact.createMany({
    data: [
      {
        relating_user: testUser.id,
        related_user: asdfUser.id,
        notes: "asdf is just soooo random :3",
        contact_frequency: "ONE_MONTH",
        category_id: socialCtg.id,
        match_id: match.id
      }
    ]
  })
  const contact2 = await prisma.contact.createMany({
    data: [
      {
        relating_user: asdfUser.id,
        related_user: testUser.id,
        notes: "a decent fellow, bit awkward but still chill",
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