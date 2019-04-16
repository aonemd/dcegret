<template>
  <div>
    <h1>
      Sign In
    </h1>

    <div id="sign-in__input-group">
      <input type="text" placeholder="Email or Username" v-model="identity">
      <br>
      <input type="password" placeholder="Password" v-model="password">
      <br>
      <button v-on:click="submit">Sign In</button>
    </div>
  </div>
</template>

<script>
import api from '../services/api/authentication.js'

export default {
  data () {
    return {
      identity: '',
      password: ''
    }
  },
  methods: {
    submit: function () {
      api.signIn(this.identity, this.password).then((response) => {
        localStorage.setItem('token', response.data.token);
        this.$router.push('/');
        location.reload();
      }).catch((error) => {
        console.log(error);
      });
    }
  }
}
</script>

<style scoped>
#sign-in__input-group input, button {
  margin-bottom: 15px;
}
</style>
