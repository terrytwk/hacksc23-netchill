const prisma = require("../config/db");

const signup = async (email, password) => {
  const user = await prisma.user.create({
    data: {
      email,
      password,
    },
  });
  return user;
};

const login = async (email, password) => {
  const user = await prisma.user.findUnique({
    where: {
      email,
    },
  });

  if (user.password == password) {
    return user;
  }
};

module.exports = {
  signup,
  login,
};
