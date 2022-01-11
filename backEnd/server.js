const path =require('path');
const express = require('express');
const app = express();
const cors=require('cors');
const router = require ('./router/index');
const bodyParser = require('body-parser');
const mongoose=require('mongoose')
// app.set('view engine','ejs');
// app.set('views','views');
// app.use(express.static(path.join(rootDir, 'public')));
app.use(bodyParser.json());
app.use(cors());
process.env.SECRET_KEY="secret"
app.use(bodyParser.urlencoded({extended:false}));


app.use(router);

// sequelize.sync()
// .then(result =>{
    
// })
// .catch(err =>{
//     //consolele.log(err);
// })

mongoose.connect( "mongodb://localhost:27017/obj")
.then(()=>{
    console.log('mongodb')
    app.listen(3000);
})   
  
  
