const getAllTags = (req, res) => {
  // fetch all tags including career and hobby

  res.status(200).json({
    message: `Fetched all the tags including career and hobby`,
    data: {
      career: [],
      hobby: [],
    },
  });
};

module.exports = { getAllTags };
