const mongoose = require('mongoose');
var Project=require('../model/index');

exports.postProject= (req,res)=>{
    
    const Name = req.body.Name;
    const skills= req.body.skills;
    const information= req.body.information;
    const averageOfprice=req.body.averageOfprice;
    
     const project= new Project({
        Name:Name,
      skills:skills,
      information:information,
      averageOfprice:averageOfprice,
      
     })
     project.save() 

      .then(()=>{
        console.log('books created');
       
      })
      .catch(err =>{
        console.log(err);
      })
  },
  exports.Projects=(req,res)=>{
    const projects = Project.find()

    }