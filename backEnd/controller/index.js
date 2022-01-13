const mongoose = require('mongoose');
var Project=require('../model/index');
var Enginer = require("../model/enginer")

exports.addProject= (req,res)=>{
    const id = req.body.id;
    const Name = req.body.Name;
    const skills= req.body.skills;
    const information= req.body.information;
    const averageOfprice=req.body.averageOfprice;
    
     const project= new Project({
      id : id, 
      Name:Name,
      skills:skills,
      information:information,
      averageOfprice:averageOfprice,
      
     })
     
     project.save() ;
     console.log('books created',id, Name , skills , information , averageOfprice);
    
  },
  
exports.addEnginer= (req,res)=>{
  const customerAddress = req.body.customerAddress;
  const day= req.body.day;
  const price=req.body.price;
  const information= req.body.information;
  
  
   const enginer= new Enginer({
    customerAddress : customerAddress, 
    day:day,
    price:price,
    information:information,
    
    
   })
   
   enginer.save() ;
 
},
  exports.Projects=(req,res)=>{
    Project.find()

    }