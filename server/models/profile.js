//this is user profile cat maker 
const mongoose = require("mongoose");

const UserProfile = new mongoose.Schema({

    title : {
        type : mongoose.Schema.Types.String,
        minLength : 5,
        maxLength : 50,
    },

    //hashing the image from the server dictionary to the dataBase // technical part 1 

    userImage : {
        type : mongoose.Schema.Types.String,
        default : ""
    },

    user_id : {
        type : mongoose.Schema.Types.ObjectId,
        ref : "users"
    }

})


const Profile = mongoose.model("profiles ", UserProfile);

module.exports = Profile;