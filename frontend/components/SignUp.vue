<template>
  <div class="row">
    <div class="col-2 col-m-6">
      <div class="sign-up__box">
        <h1>Sign Up</h1>

        <div class="sign-up__textbox">
          <input type="text" placeholder="Email" v-model="email">
        </div>

        <div class="sign-up__textbox">
          <input type="text" placeholder="Username" v-model="username">
        </div>

        <div class="sign-up__textbox">
          <input type="password" placeholder="Password" v-model="password">
        </div>

        <input type="button" class="sign-up__btn" v-on:click="submit" value="Sign up">
      </div>
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

<style lang="scss" scoped>
$primary-color: #407ee7;

.sign-up__box {
  width: 500px;
  padding: 40px;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background-color: #191919;
  text-align: center;

  color: white;

  h1 {
    font-size: 40px;
    margin-bottom: 50px;
    padding: 13px 0;
    font-weight: 500;
  }
}

.sign-up__textbox {
  width: 80%;
  overflow: hidden;
  font-size: 20px;
  margin: 20px auto;
  padding: 14px 10px;
  border: 2px solid $primary-color;

  input {
    border: none;
    outline: none;
    background: none;
    color: white;
    font-size: 18px;
    width: 80%;
    margin: 0 10px;
    text-align: center;
  }
}

.sign-up__btn {
  width: 80%;
  background: none;
  border: 2px solid $primary-color;
  color: white;
  padding: 5px;
  font-size: 18px;
  cursor: pointer;
  margin: 12px 0;
}
</style>
