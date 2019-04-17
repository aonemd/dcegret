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
  computed: {
    authenticated() {
      return this.$store.getters.is_account_authenticated;
    }
  }
}
</script>
