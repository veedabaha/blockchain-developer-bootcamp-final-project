const express = require('express');
const router = express.Router();
const adminControler = require('../controller/index');

router.get('/getProject',adminControler.postProject);
router.post('/project',adminControler.Projects);


module.exports=router;