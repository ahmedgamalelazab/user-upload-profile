const User = require("../models/user");
//controlling the routes with simple middleware here

exports.register = async (req, res, next) => {
  const { userName, userEmail, userPassword } = req.body;

  if (!userName || !userEmail || !userPassword) {
    return res
      .status(400)
      .json({ error: true, errorMessage: "No userForm data provided" });
  }

  //search for the user

  let user = await User.findOne({ userEmail: userEmail });

  if (user) {
    return res
      .status(400)
      .json({ error: true, errorMessage: "user Registered already" });
  }

  //if no user

  try {
    user = await User.create({
      userName: userName,
      userEmail: userEmail,
      userPassword: userPassword,
    });

    const userToken = user.genJsonWebToken();
    //if all are ok
    return res.status(201).json({
      error: false,
      errorMessage: null,
      success: true,
      userName : user.userName,
      userEmail : user.userEmail,
      token : userToken
    });
  } catch (error) {
    return res.status(500).json({ error: true, errorMessage: "server failed" });
  }

  //if all ok
};

//login
exports.login = async (req, res, next) => {
  //user inputs userEmail and user password
  const { userEmail, userPassword } = req.body;

  if (!userEmail || !userPassword) {
    return res
      .status(400)
      .json({ error: true, errorMessage: "No userForm data provided" });
  }

  //if ther's data coming from form

  try {
    //searching for userEmail
    let user = await User.findOne({ userEmail: userEmail });
    //no user => invalid userName or userPassword
    if (!user) {
      return res
        .status(401)
        .json({
          error: true,
          errorMessage: "invalid userName Or userPassword",
        });
    }

    //if user found lets authenticate him down

    const isMatch = await user.authenticate(userPassword);

    if (!isMatch) {
      return res
        .status(401)
        .json({
          error: true,
          errorMessage: "invalid userName Or userPassword",
        });
    }

    const userToken = user.genJsonWebToken();

    //else
    return res
      .status(200)
      .json({ error: false, errorMessage: null, success: true, userName : user.userName , userEmail : user.userEmail , token : userToken });
  } catch (error) {
    return res.status(500).json({ error: true, errorMessage: "server failed" });
  }
};
