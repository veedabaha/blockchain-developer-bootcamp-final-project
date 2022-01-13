<template>
  <div>
    <form @click="getProject()" >
            <div>
              <label>Customer Address:</label>
              <input type="text" v-model="customerAddress" id="customerAddress" required placeholder="Enter your Address.. ">
              
            </div>
         
          <button type="submit" class="btn btn-dark">Get</button>
      </form> 
    <div class="card" style="width:80%; margin-left:10% ; padding-top: 3%" >
    <div class="card-body" >
      <h3 class="card-title" style="font-family: cursive;">Record details</h3>
      <p class="card-text" > His/Her Full Name :   {{this.project[0]}}</p>
      <p class="card-text">His/Her Doctor Address :   {{this.project[1]}}</p>
      <p class="card-text">His/Her patient Address :  {{this.project[2]}}</p>
      <p class="card-text">Chief Complient :  {{this.project[3]}}</p>
      <p>{{this.project[4]}}</p>
      <router-link to="/ProjectEdit"></router-link>
      
    
  </div>
    <!-- <form @click="deleteProject()" >
            <div>
              <label>Customer Address:</label>
              <input type="text" v-model="customerAddress" id="customerAddress" required placeholder="Enter your Address.. ">
              
            </div>
         
         
      </form>  -->
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
