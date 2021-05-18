const {register , login} = require("../controllers/user");
const router = require("express").Router();



router.route("/profileMaker/users/register").post(register);

router.route("/profileMaker/users/login").post(login);










module.exports = router;



