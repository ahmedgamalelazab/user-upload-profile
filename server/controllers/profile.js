const Profile = require("../models/profile");
const path = require("path");
const fs = require("fs");

//hash the location of the picture
//use statics to open a way to get this photos

exports.addProfile = async (req, res, next) => {
  //hashing
  const user_id = req.user._id;
  const { title } = req.body;
  console.log(req.body);

  if (!user_id || !title) {
    return res
      .status(400)
      .json({ error: true, errorMessage: "no data Provider!" });
  }

  //hash this data in the data base

  try {
    let profile = await Profile.create({
      title: title,
      userImage: req.file.path,
      user_id: user_id,
    });

    console.log(req.file);

    return res.status(201).json({
      error: false,
      errorMessage: null,
      image: profile.userImage,
      user_id: profile.user_id,
      title: title,
    });
  } catch (error) {
    console.log(error);
    return res.status(500).json({
      error: true,
      errorMessage: error,
    });
  }
};

exports.getProfiles = async (req, res, next) => {
    const user_id = req.user._id;
  const userFolderName = req.user.userName.split(" ");
  let userFolderPath = "";
  for (let i = 0; i < userFolderName.length; i++) {
    userFolderPath += userFolderName[i];
  }
  let userPath = `./uploads/${userFolderPath}`;
  console.log(userPath);
  if (!fs.existsSync(userPath)) {
    return res.status(400).json({
      error: true,
      errorMessage: "can't find any image",
    });
  }

  const profiles = await Profile.find({user_id : user_id});

  let eachProfileImage = [];
  

  profiles.forEach((profile)=>{
     eachProfileImage.push(profile.userImage);
  });

  return res.status(200).json({
    error: false,
    errorMessage: null,
    profiles: eachProfileImage,
  });
};

exports.deleteProfile = async (req, res, next) => {
  const profileId = req.params.profileId;

  const { profilePath } = req.body;

  if (!profileId || !profilePath) {
    return res
      .status(400)
      .json({ error: true, errorMessage: "no data provided" });
  }

  try {
    fs.unlinkSync(profilePath);

    const result = await Profile.deleteOne({ _id: profileId });

    //if all are ok

    return res.status(201).json({
      error: false,
      errorMessage: null,
      profileIDdeleted: profileId,
      path: profilePath,
    });
  } catch (error) {
    console.log(error);
    return res.status(500).json({ error: true, errorMessage: error });
  }
};
