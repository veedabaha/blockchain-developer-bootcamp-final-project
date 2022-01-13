const mongoose = require('mongoose');



const projectSchema= mongoose.Schema(
  {
    
    customerAddress: {
      type: String
      
    },
    day: {
      type: String
    },
    price: {
        type: Number
      },
    information: {
      type: String
    },
    
  
 
})


const Enginer= mongoose.model("enginer",projectSchema);
module.exports = Enginer;