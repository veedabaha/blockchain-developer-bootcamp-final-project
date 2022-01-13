<template>  
    <main>
      <div class="card card-1" >
       
         <h1> Post your Project </h1><br><br> 
          <ProjectForm />
     </div>
    </main>
</template>

<script>
import ProjectForm from "../components/ProjectForm.vue";


export default {
  
  components:{
    ProjectForm : ProjectForm
  },
  
}
</script>
