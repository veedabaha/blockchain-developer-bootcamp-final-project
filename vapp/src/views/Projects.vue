<template>
  <div>
    <form @click="getProject()" >
            <div class="card" style="width:80%; margin-left:10% ; padding-top: 3%" >
              <div class="card-body" >
                <label>Customer Address:</label>
              <input type="text" v-model="customerAddress" id="customerAddress" required placeholder="Enter your Address.. ">
               <button type="submit" class="btn btn-dark">Get</button>
              </div>
            </div>
         
         
      </form> 
    <div class="card" style="width:80%; margin-left:10% ; padding-top: 3%" >
    <div class="card-body" >
      <h3 class="card-title" style="font-family: cursive;">Record details</h3>
      <p class="card-text" > Poject Name :   {{this.project[0]}}</p>
      <p class="card-text">The skills of the projects:   {{this.project[1]}}</p>
      <p class="card-text">More information :  {{this.project[2]}}</p>
      <p class="card-text">avarage price :  {{this.project[3]}}</p>
      <p>{{this.project[4]}}</p>
     
      
    
  </div>
       <router-link to="/ProjectEdit" class="btn btn-dark">Edit</router-link>
       <router-link to="/chooseProject" class="btn btn-dark" >Choose Project</router-link>
  </div>
  </div>
</template>

<script>
import App from '../index';
export default {
 
  data() {
    return {
      customerAddress : null,
      project: []
    };
  },
  methods: {
    // async onDestroy(_customerAddress) {
    //   const sure = window.confirm('Are you sure?');
    //   if (!sure) return;
    //   await App.App.deleteProject(_customerAddress);
    //   this.flash('task deleted sucessfully!', 'success');
    //   const newtasks = this.tasks.filter(task => task.customerAddress !== customerAddress);
    //   this.tasks = newtasks;
    // },
    async getProject() {
        let p = {
          customerAddress: this.customerAddress,
           
      };
      console.log(this.customerAddress);
    this.project = await App.App.getProject(p.customerAddress);
    console.log(this.project);
    this.customerAddress=null
  },
    
  } 
}
</script>

<style>

/* === Wrapper  ===*/
.s{
  text-align: center;
  align-items: center;
  margin: 100px;
}
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