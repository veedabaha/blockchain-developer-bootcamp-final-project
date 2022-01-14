<script>
import App from "../index.js";
export default {
    data(){
        return{
            engineerAddress: null,
            yourName: null,
        }
    },
    methods: {
       async  addEngineer() {
        let engineer = {
            engineerAddress: this.engineerAddress,
            yourName: this.yourName,
           
        }
        let saved = await App.App.addCustomer(engineer.engineerAddress, engineer.yourName)
        
        
        
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
      <form action="/Projects" @click="addEngineer()" >
        <h3>you should Register as Engineer</h3><br><br> 
        <v-row>
          <v-col col="6" sm="5" >
            <div>
              <label>your Address:</label>
              <input type="text" v-model="engineerAddress" id="" required placeholder="Enter your Address.. ">
              
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
    box-shadow: 0 3px 60px rgba(177, 150, 100, 0.35);
  
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