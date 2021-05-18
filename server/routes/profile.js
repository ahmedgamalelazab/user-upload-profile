const {auth} = require("../middleware/auth");

const {addProfile , deleteProfile,getProfiles} = require("../controllers/profile");

const router = require("express").Router();

const upload = require("../middleware/upload");

router.route('/profileMaker/profiles/add').post(auth,upload,addProfile);

router.route('/profileMaker/profiles/deleteProfile/:profileId').delete(auth,deleteProfile);

router.route('/profileMaker/profiles').get(auth,getProfiles);





module.exports = router;



