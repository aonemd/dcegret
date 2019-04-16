<template>
  <div>
    <h1>{{ key }}</h1>
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
    key() {
      return this.$store.state.key;
    }
  }
}
</script>
