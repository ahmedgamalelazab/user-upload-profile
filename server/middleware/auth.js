//here we will check for the user if he or she registered already or not
const jwt = require("jsonwebtoken");
const User = require("../models/user");

exports.auth = async (req, res, next) => {
  const token = req.headers["x-auth-token"];

  if (!token) {
    return res
      .status(400)
      .json({ error: true, errorMessage: "No token provided" });
  }

  //if token provided

  //check it
  try {
    const decoded = jwt.verify(token, process.env.PROFILE_APP_USER_SECRET);

    if (!decoded) {
      return res.status(401).json({ error: true, message: "INVALID TOKEN" });
    }

    const user = await User.findOne({
      _id: decoded.id,
    });

    if (!user) {
      return res.status(401).json({ error: true, message: "INVALID TOKEN" });
    }

    req.user = user;

    next();
  } catch (error) {
    return res.status(401).json({ error: true, message: "INVALID TOKEN" });
  }
};
