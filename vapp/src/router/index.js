
import Vue from "vue";
import VueRouter from "vue-router";
import HomeView from "../views/HomeView.vue";
import AboutView from "../views/AboutView.vue";
import addEngineer from "../views/addEngineer.vue";
import addcustomer from "../views/addcustomer.vue";
import addProject from "../views/addProject.vue";
import Projects from "../views/Projects.vue";
import EditProject from "../views/EditProject.vue";
import chooseProject from "../views/chooseProject";
import enginer from "../views/enginer";
import setValue from "../views/setPrice.vue";
import Values from "../views/Values.vue";



Vue.use(VueRouter);
const routes = [
    {
      path: '/',
      name: 'home',
      component: HomeView
    },
    {
      path: '/enginer',
      name: 'enginer',
      component: enginer
    },
    {
      path: '/chooseProject',
      name: 'chooseProject',
      component: chooseProject
    },
    {
      path: '/about',
      name: 'about',
      component:AboutView
    },
    {
      path: '/addEngineer',
      name: 'addEngineer',
      component: addEngineer
    },
    {
      path: '/addCustomer',
      name: 'addCustomer',
      component: addcustomer
    },
    {
      path: '/addProject',
      name: 'addProject',
      component:addProject
    }
    ,
    {
      path: '/Projects',
      name: 'Projects',
      component:Projects
    }
    ,
    {
      path: '/ProjectEdit',
      name: 'EditProject',
      component:EditProject
    }
    ,
    {
      path: '/setValue',
      name: 'setValue',
      component:setValue
    }
    ,
    {
      path: '/Values',
      name: 'Values',
      component:Values
    }

  ]

  const router = new VueRouter({
    mode: "history",
    base: process.env.BASE_URL,
    routes
  });
  
  export default router;

