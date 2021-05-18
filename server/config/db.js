//connection configuration 
const mongoose= require("mongoose");
const DBConnection = async function(){
    try{
        //api $$ connection $$ models $$ queries 
        await mongoose.connect(process.env.MONGOOSE_DEV_URL , {useCreateIndex : true , useFindAndModify : true, useNewUrlParser : true , useUnifiedTopology : true });
        //if all ok 
        console.log("connected successfully to mongodb");
    }catch(err){
        console.log(err);
    }
}

module.exports = DBConnection;