<template>
<div>
  <header>
  <div class="l">
      <img alt=" logo" class="l" src="@/assets/white-logo.png" width="250" height="200" />
    <HelloWorld class="l"/>

  </div>
    <div class="wrapper">
      

      <nav class="nav">
        <router-link class="btn btn-warning" to="/">Home</router-link>
        <router-link class="btn btn-warning" to="/addProject">addprojects</router-link>
        <router-link class="btn btn-warning" to="/Projects">projects</router-link>
        <router-link class="btn btn-warning" to="/Values">Values</router-link>
        <router-link class="btn btn-warning" to="/setValue">set Value</router-link>
        <router-link class="btn btn-warning" to="/about">About</router-link>

      </nav>
    </div>
  </header>
 <router-view />
   </div>
  
</template>
<script>
import HelloWorld from './components/HelloWorld.vue'
export default {
  components:{
    HelloWorld:HelloWorld
  }
  
  }
</script>

<style>
#app {
  /* font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #50402c; */
}

#nav {
  padding: 30px;
}

#nav a {
  font-weight: bold;
  color: #50422c;
}

#nav a.router-link-exact-active {
  color: #b97b42;
}
.l{
  display: inline-block;
}

</style>
