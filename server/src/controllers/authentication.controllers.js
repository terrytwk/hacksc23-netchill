const signup = (req, res) => {
  const { email, password } = req.body;

  // add user to database

  res.status(200).json({
    message: `Successfully signed up user with email: ${email}`,
    token: "",
  });
};

const login = (req, res) => {
  const { email, password } = req.body;

  // check user with same email & password

  res.status(200).json({
    message: `Successfully logged in user with email: ${email}`,
    token: "",
  });
};

module.exports = { signup, login };
