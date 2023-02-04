const authServices = require('../services/authentication.services')

const signup = async (req, res) => {
  const { email, password } = req.body;

  const user = await authServices.signup(email, password);

  res.status(200).json({
    message: `Successfully signed up user with email: ${email}`,
    token: user,
  });
};

const login = async (req, res) => {
  const { email, password } = req.body;

  // check user with same email & password

  res.status(200).json({
    message: `Successfully logged in user with email: ${email}`,
    token: "",
  });
};

module.exports = { signup, login };
