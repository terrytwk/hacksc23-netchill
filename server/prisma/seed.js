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

async function main() {
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