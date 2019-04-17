<template>
  <div>
    <navbar></navbar>
    <div id="container">
      <router-view></router-view>
    </div>
  </div>
</template>

<script>
import Navbar from './components/Navbar.vue';

export default {
  components: {
    'navbar': Navbar
  },
  computed: {
    authenticated() {
      return this.$store.getters.is_account_authenticated;
    }
  }
}
</script>

<style>
@import "assets/stylesheets/grid.css";
@import "assets/stylesheets/typography.css";
@import "assets/stylesheets/utils.css";

#container {
  margin: 100px auto;
}

body {
  margin: 0;
  padding: 0;

  background-image: url('./assets/images/landing-image.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-position: center;
  background-size: cover;
}
</style>
