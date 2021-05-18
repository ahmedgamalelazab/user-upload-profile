const multer = require("multer");
const fs = require("fs");
const path = require("path");

//this middleware is focusing on uploading images

//api

//! api here => multer and path with fs

//connect

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    const userFolderName = req.user.userName.split(" ");
    let userFolderPath = "";
    for (let i = 0; i < userFolderName.length; i++) {
        userFolderPath += userFolderName[i];
    }
    let userPath = `./uploads/${userFolderPath}`; // this is a path for every single user
    
    if (!fs.existsSync(userPath)) {
      fs.mkdirSync(userPath);
    }

    req.EachUserPath = userFolderPath;

    cb(null, userPath);
  },

  filename: function (req, file, cb) {
    cb(
      null,
      file.fieldname + "-" + Date.now()+'-'+req.user._id+ path.extname(file.originalname)
    );
  },
});

//query

const upload = multer({ storage: storage }).single("img");

module.exports = upload;
