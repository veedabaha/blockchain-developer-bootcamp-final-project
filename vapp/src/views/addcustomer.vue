<script>
import App from "../index.js";
export default {
    data(){
        return{
          
            customerAddress: null,
            yourName: null,
    
        }
    },
    methods: {
      async   addCustomer() {
        let customer = {
            customerAddress: this.customerAddress,
            yourName: this.yourName,
           
        }
        let saved = await App.App.addCustomer(customer.customerAddress, customer.yourName)
        
        console.log(saved);

        this.customerAddress = null;
        this.yourName = null;
       
   }
  },

}

</script>
<template>
  <div class="card card-1" data-app>
     <div class="box-form">
      <form action="/addProject" @click="addCustomer()">
        <h3> you should Register as customer for post a project</h3><br><br> 
        <v-row>
          <v-col col="6" sm="5" >
            <div>
              <label>your Address:</label>
              <input type="text" v-model="customerAddress" id="" required placeholder="Enter your Address.. ">
              
            </div>
          </v-col>  
        </v-row>
        <v-row> 
          <v-col col="6" sm="5" >
            <div>
                <label>your Name :</label>
                <input type="text" v-model="yourName" id="name" required placeholder="Enter your name.. ">
            
            </div>
          </v-col>
        </v-row>
        <input type="submit" id="btn">
      </form>
 </div>
 </div>
</template>
<style>
.box-form{
    margin: 30px;
    padding: 30px;
    text-align: center;
    border: 1px;

}
input{
    margin: 10px;
    padding: 7px;
}
#btn{
    background-color: coral;
    padding:5px 15px;
    border: 0px ;
box-shadow: 0 3px 5px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
}
#btn:hover{
      background-color: coral;
    padding:8px 18px;
    border: 0px ;
    transition: 2s;
    grid-auto-columns: min-content;

}


</style>