const login = (req, res) => {
  const { email, password } = req.body;

  res.status(200).json({
    body: `working ${email} and ${password}`,
  });
};

module.exports = { login };
