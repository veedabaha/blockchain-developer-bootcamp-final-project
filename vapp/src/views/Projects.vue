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
      <h3 class="card-title" style="font-family: cursive;">Project details</h3>
      <p class="card-text" >Project Name :   {{this.project[0]}}</p>
      <p class="card-text">what Skill need :   {{this.project[1]}}</p>
      <p class="card-text">info :  {{this.project[2]}}</p>
      <p class="card-text">The avarege of price :  {{this.project[3]}}</p>
      <router-link to="/ProjectEdit">Edit</router-link>
      <router-link to="/setPrice">set value</router-link>
  </div>
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
  }
  },
  
};
</script>