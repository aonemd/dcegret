<template>
  <div class="row">
    <div class="col-2 col-m-6">
      <div class="sign-in__box">
        <h1>Sign In</h1>

        <div class="sign-in__textbox">
          <input type="text" placeholder="Email or Username" v-model="identity">
        </div>

        <div class="sign-in__textbox">
          <input type="password" placeholder="Password" v-model="password">
        </div>

        <input type="button" class="sign-in__btn" v-on:click="submit" value="Sign in">
      </div>
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

<style lang="scss" scoped>
$primary-color: #407ee7;

.sign-in__box {
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

.sign-in__textbox {
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

.sign-in__btn {
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
