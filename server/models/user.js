const bcrypt = require("bcrypt");
const joi = require("joi");
const mongoose = require("mongoose");
const jwt = require("jsonwebtoken");

const UserSchema = new mongoose.Schema({
    userName : {
        type : mongoose.Schema.Types.String,
        minLength : 5,
        maxLength : 50
    },
    userEmail : {
        type: mongoose.Schema.Types.String,
        match : [/^(?=.*[\.])(?!.*(^[0-9]))(?!.*([0-9.])$)([a-zA-Z0-9]+@+[a-zA-Z0-9.]+)$/i,"Pleas provide a valid email address"],
    },
    userPassword : {
        type : mongoose.Schema.Types.String,
        minLength : 8,
        maxLength : 50
    }
})

//crypting the user password pre save it to the data bse 

UserSchema.pre("save",async function(next){
    if(!this.isModified('userPassword')){
        next();
    }

    const salt = await bcrypt.genSalt(10);
    this.userPassword = await bcrypt.hash(this.userPassword , salt);

    next();

});


//section of user itegreted methods 

UserSchema.methods.authenticate = async function(userFormPassword){
    return await bcrypt.compare(userFormPassword , this.userPassword);
}

//generating jsonwebtoken 

UserSchema.methods.genJsonWebToken = function(){

    // hiding user id in the token will be enough for me 
    const token = jwt.sign({id : this._id},process.env.PROFILE_APP_USER_SECRET);

    return token;

}



const User = mongoose.model("users",UserSchema);


module.exports = User;


