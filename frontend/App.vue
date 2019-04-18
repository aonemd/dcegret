<template>
  <div>
    <navbar></navbar>
    <router-view></router-view>
  </div>
</template>

<script>
import Navbar from './components/Navbar.vue';

export default {
  components: {
    'navbar': Navbar
  },
  created() {
    document.body.id = this.$store.getters.is_account_authenticated ? '' : 'landing';
  }
}
</script>

<style lang="scss">
@import "assets/stylesheets/grid.css";
@import "assets/stylesheets/typography.css";
@import "assets/stylesheets/utils.css";

body {
  margin: 0;
  padding: 0;

  background-image: none;
  background-color: #262626;
}

body#landing {
  background-image: url('./assets/images/landing-image.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-position: center;
  background-size: cover;
}

</style>
