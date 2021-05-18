require("dotenv").config({path : "./config.env"});
const path = require("path");
//starting code here 
const {server , helmet , morgan} = require("./core/core");

//launching the server 

console.log(process.env.PORT);


server.use("/uploads",require("express").static(path.join(__dirname ,"uploads")));
server.use(require("express").json());
server.use(helmet());
server.use(morgan("common"));
server.use("/api",require("./routes/user"));
server.use("/api",require("./routes/profile"));


server.listen(process.env.PORT,()=>console.log(`connected successfully to server on port = : ${process.env.PORT}`));

