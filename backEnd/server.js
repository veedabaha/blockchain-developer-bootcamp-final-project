const path =require('path');
const express = require('express');
const app = express();
const cors=require('cors');
const router = require ('./router/index');
const bodyParser = require('body-parser');
const mongoose=require('mongoose');
app.use(bodyParser.json());
app.use(cors());
process.env.SECRET_KEY="secret"
app.use(bodyParser.urlencoded({extended:false}));


app.use(router);

mongoose.connect( "mongodb://localhost:27017/project")
.then(()=>{
    console.log('mongodb')
    app.listen(3000);
})   
  
  
