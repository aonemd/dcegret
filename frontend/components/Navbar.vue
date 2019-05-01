<template>
  <nav>
    <div class="title">
      <router-link to="/" exact>DCEgret</router-link>
    </div>

    <label for="toggle">&#9776;</label>
    <input type="checkbox" id="toggle">

    <div class="menu">
      <router-link v-show="authenticated" to="/community" exact>Community</router-link>
      <router-link v-show="authenticated" to="/messages" exact>Messages</router-link>
      <router-link v-show="!authenticated" to="/sign-up" exact>Sign Up</router-link>
      <router-link v-show="!authenticated" to="/sign-in" exact>Sign In</router-link>
      <router-link v-show="authenticated" to="/account/settings" exact>{{ username }}</router-link>
      <router-link v-show="authenticated" to="/sign-out" exact>Sign Out</router-link>
    </div>
  </nav>
</template>

<script>
export default {
  computed: {
    authenticated() {
      return this.$store.getters.is_account_authenticated;
    },
    username() {
      return this.$store.getters.current_account_username;
    }
  }
}
</script>

<style lang="scss" scoped>
$height: 65px;
$background-color: #fff;

nav {
  background-color: $background-color;
  height: auto;
  line-height: $height;
  min-height: $height;
  padding: 0 15px;
  margin-bottom: 35px;

  .title a {
    color: black;
    font-size: 28px;
    font-weight: bold;
    text-decoration: none;
    float: left;
    margin: 0 16px;
  }

  .menu {
    text-align: center;
    width: 100%;
    display: none;

    a {
      background-color: $background-color;
      color: black !important;
      text-decoration: none;
      font-size: 18px;
      line-height: $height;

      clear: right;
      display: block;
      margin: 0;

      :hover {
        transition: color .2s ease-in-out;
      }
    }
  }


  label {
    //color: var(--gray);
    font-size: 26px;
    line-height: $height;
    cursor: pointer;
    margin: 0 16px;

    display: block;
    width: 26px;
    float: right;
  }

  #toggle {
    display: none;
  }

  #toggle:checked + .menu {
    display: block;
  }
}

@media only screen and (min-width: 640px) {
  nav {
    .menu {
      margin: 0 16px 0 0;
      text-align: right;
      display: block;

      a {
        margin: 0 20px;
        display: inline-block;
      }
    }

    label {
      display: none;
    }
  }
}
</style>
