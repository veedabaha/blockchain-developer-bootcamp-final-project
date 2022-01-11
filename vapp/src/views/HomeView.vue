<script setup >
// import TheWelcome from '@/components/TheWelcome.vue'


</script>

<template>
  <div>
    <header>
    <!-- <TheWelcome /> -->
  </header>
  <main>
    <div class="btn">
      
    <h1>The Best Way For Any Job,</h1>
    <p>The projects in the etherum chain for doing and earn the money</p>
      <p>choess one : </p>
      <a href="/addCustomer">Post A project</a> 
      <a href="/addEngineer">Earn money Engineer</a>
    </div>
    <hr>
    <div class="btn">
       <h1>Do you need this things?</h1>
      <div class="flex" >
        <div class="flex-container"> 
          <h2>Post a job</h2>
          <p>It’s free and easy to post a job. Simply fill in a title, description and budget and competitive bids come within minutes</p>
        </div>
        <div class="flex-container">
          <h2>Pay safely</h2>
          <p>Only pay for work when it has been completed and you're 100% satisfied with the quality using our etherum payment system.</p>
        </div>
        <div class="flex-container">
          <h2>We’re here to help</h2>
          <p>this system save your projects to etherum network and help you to completed your project with out any problem. </p>
        </div>
        
        
      </div>
   </div>
    <hr>
   <div>
       <h1>The projects for doing : </h1>
      <div class="flex" >
        <div class="flex-container"> <h2></h2>
        <p>It’s free and easy to post a job. Simply fill in a title, description and budget and competitive bids come within minutes</p></div>
        
        </div>
   </div>
  </main>

  </div>
</template>
<style>
a{
  padding: 10px;
  margin: 15px;
  
}
.btn{
  margin: 30px;
  padding: 20px;
}
h1{
  margin: 10px;
}
p{
  margin: 5px;
  margin-bottom: 10px;
}
.flex {
  display: flex;
}

.flex > div {
  background-color: #f1f1f1;
  margin: 20px;
  padding: 20px;
  font-size: 20px;

}
</style>
