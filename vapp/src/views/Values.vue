<template>
<div>
    <p>if you accept the price that Engineer set you payed the 20% the price : </p>
    <button class="btn btn-dark" @click="accepteCustomer('0xE017b76Ed73e93eab505b55c2A4B07B7A2B56cB5')">accepteCustomer</button>
    <p> you payed the 50% the price : </p>   
    <button class="btn btn-dark" @click="halfPayment('0xc660f3f39A078Df492f2157Ffb2e220AA1dd8e77')">halfPayment</button>
    <p>you payed the 70% the price and finish the project : </p>
    <button class="btn btn-dark" @click="halfPayment('0xc660f3f39A078Df492f2157Ffb2e220AA1dd8e77')">finishTheProject</button>
    <p>return the value may have on contract : </p>
    <button class="btn btn-dark" @click="_passthevalue()">passthevalue</button>
    
  </div>
</template>

<script>
import App from "../index.js"
export default {
    data() {
    return {
      customerAddress : "0xeE98f55D75bDAa9D944368fDB11f7CFC2e35D2d2",
      engineerAddress : "0xc660f3f39A078Df492f2157Ffb2e220AA1dd8e77"
    }
    },
    methods: {

    async accepteCustomer(p) {
    this.project = await App.App.accepteCustomer(p);
    console.log(this.project , "....................");
  },
    async halfPayment(e) {
    this.project = await App.App.halfPayment(e);
    console.log(this.project , "....................");
  },
  async finishTheProject(p) {
    this.project = await App.App.finishTheProject(p);
    console.log(this.project , "....................");
  },
  async _passthevalue() {
    this.project = await App.App._passthevalue();
    console.log(this.project , "....................");
  }
    }  


}
</script>

<style>

</style>