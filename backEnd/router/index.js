const express = require('express');
const router = express.Router();
const adminControler = require('../controller/index');

router.post('/postProject',adminControler.addProject);
router.post ('/enginer',adminControler.addEnginer);
router.post('/project',adminControler.Projects);


module.exports=router;