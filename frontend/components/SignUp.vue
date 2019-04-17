<template>
  <div>
    <h1>
      Sign Up
    </h1>

    <div id="sign-up__input-group">
      <input type="text" placeholder="Email" id="sign-up__email" v-model="email">
      <br>
      <input type="text" placeholder="Username" id="sign-up__username" v-model="username">
      <br>
      <input type="password" placeholder="Password" id="sign-up__password" v-model="password">
      <br>
      <button id="sign-up__button" v-on:click="submit">Sign up</button>
    </div>
  </div>
</template>

<script>
import api from '../services/api/authentication.js'

export default {
  data() {
    return {
      email: '',
      username: '',
      password: ''
    }
  },
  methods: {
    submit: function () {
      api.signUp(this.email, this.username, this.password).then((response) => {
        localStorage.setItem('token', response.data.token);
        this.$router.push('/');
        location.reload();
      }).catch((error) => {
        console.log(error.response.data);
      });
    }
  }
}
</script>

<style scoped>
#sign-up__input-group input, button {
  margin-bottom: 15px;
}
</style>
