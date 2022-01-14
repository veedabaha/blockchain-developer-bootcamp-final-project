<template>  
    <main>

      <div class="card card-1" >
        <h1> Enter your information</h1><br><br> 
         <div class="box form">
          <form @click="chooseToWork()" >
          <v-row> 
          <v-col col="6" sm="5" >
            <div>
              <input 
              type="text" 
              v-model="customerAddress" 
              id="customerAddress" 
              required placeholder=" ">
              <label>Customer Address </label>
            </div>
          </v-col>
          <v-col sm="1"></v-col>
          <v-col col="6" sm="5" >
            <div>
              <input 
              type="text" 
              v-model="day" 
              id="day" 
              required placeholder=" ">
              <label>day </label>
            </div>
          </v-col>
           <v-col sm="1"></v-col>
         
        </v-row>

        <v-row>
          <v-col sm="5" col="6">
            <div>
              <input 
              type="text" 
              name="" 
              required placeholder=" " 
              v-model="information" >
              <label>Tell me more information about Project </label>
            </div>
          </v-col>
          <v-col sm="1"></v-col>
          <v-col sm="5" col="6">
            <div>
               
              <input 
              type="text" name="" 
              required placeholder=" " 
              v-model="price">
              <label>price </label>
             
            </div>
          </v-col>
        </v-row>

      <router-link to="/setValue" class="btn btn-dark" > save </router-link>

</form>
   
     </div>
    </div>
    </main>
</template>

<script>
import App from "../index.js";
import api from "../../api/project"
export default {
    data(){
        return{
           
            customerAddress: null,
            day: null,
            information: null,
            price: null,
            
           
     
        }
    },
    methods: {
        async chooseToWork() {
        let Project = {
         
            customerAddress: this.customerAddress,
            day: this.day,
            price : this.price,
            information: this.information,
           
            
           
        }
        let saved = await App.App.chooseToWork( Project.customerAddress,Project.day,Project.price ,Project.information)
        api.addEnginer(Project.customerAddress,Project.day,Project.price ,Project.information);
        console.log(saved);
        
        this.customerAddress = null;
        this.day = null;
        this.price = null;
        this.information = null;
        
       
     
   }
  },

}
</script>

<style scoped>

/* === Wrapper  ===*/
.wrapper{
  height: 100%;
  width: 100%;
  display: grid;
  grid-template-columns: 1fr;
  grid-template-areas:
    "nav-bar"
    "box"
    "footer";
}

/* ===form ===*/ 
.box{
    grid-area: box;
    position: absolute;
    top:  100%;
    width: 600px;
    background-color: #FFF;
    padding: 40px;
    box-sizing: border-box;
    border: 1px solid rgba(180, 169, 118, 0.1);
    /* box-shadow: 0 30px 20px rgba(0,0,0,.2); */
    box-shadow: 0 3px 60px rgba(185, 140, 58, 0.35);
  
}

.box h2{
	margin: 0 0 40px;
	padding: 0;
	color: rgb(165, 104, 55);
	text-transform: uppercase;
	text-align: center;
}

.box input{
	padding: 10px 0;
	margin-bottom: 30px;
}

.box input {
	width: 100%;
	box-sizing: border-box;
	box-shadow: none;
	outline: none;
	border: none;
	border-bottom: 2px solid #999;
}

#submit{
  font-size: 1.1em;
	border: none;
	cursor: pointer;
  background: linear-gradient(-60deg, #c47806, #d3701f, #b86127);
	animation: gradient 20s ease-in-out infinite;
  outline: none;
	color: rgb(10, 1, 1);
	margin: 5px;
  padding: 10px;
	text-transform: uppercase;
  width: 50%;
}

@keyframes gradient {
	  0%{background-position: 0 0;}
    50% {background-position: 50% 0;}
    100%  {background-position: 0 0;}
}

.form div{
	position: relative;
}

.form div label {
	position: absolute;
	top: 10px;
	left: 0;
	color: #999;
	pointer-events: none;
	transition: .5s;
}

.box input:focus ~ label, .box textarea:focus ~ label, 
.box input:valid ~ label, .box textarea:valid ~ label {
	top: -12px;
	left: 0;
  color: #e97324;
	font-size: 1em;
	font-weight: bold;
  
}

.box input:focus ~ label, .box textarea:focus ~ label, 
.box input:valid, .box textarea:valid {
  border-bottom: 2px solid #be6c0e;
}

v-select:focus ~ label,
v-select:valid ~ label {
	top: -12px;
	left: 0;
  color: #eca727;
	font-size: 1em;
	font-weight: bold;
}

v-select:focus ~ label,
v-select:valid ~ label{
  border-bottom: 2px solid #d3851e;
}
</style>