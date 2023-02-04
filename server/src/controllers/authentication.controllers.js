const authServices = require("../services/authentication.services");

const signup = async (req, res) => {
  const { email, password } = req.body;

  const user = await authServices.signup(email, password);

  res.status(200).json({
    message: `signed up user with email: ${email}`,
    token: user,
  });
};

const login = async (req, res) => {
  const { email, password } = req.body;

  const user = await authServices.login(email, password);

  if (user) {
    res.status(200).json({
      message: `logged in user with email: ${email}`,
      token: user,
    });
  } else {
    res.status(401).json({
      message: "invalid email or password",
    });
  }
};

module.exports = { signup, login };
