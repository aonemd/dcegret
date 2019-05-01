<template>
  <div>
    <div class="row">
      <div class="col-4 col-m-6 center text-center">
        Private Profile <input type="checkbox" v-model="settings.private_profile"></input>

        <br>
        <br>
        <br>

        <input type="button" class="profile__save-button" v-on:click="update" value="Save">
      </div>
    </div>
  </div>
</template>

<script>
import accountApi from '../services/api/account.js';

export default {
  data() {
    return {
      settings: {}
    }
  },
  computed: {
    authenticated() {
      return this.$store.getters.is_account_authenticated;
    }
  },
  created() {
    accountApi.fetch_settings(this.$store.getters.current_account_token).
      then((response) => this.settings = response.data.settings);
  },
  methods: {
    update: function() {
      accountApi.update_profile(this.settings, this.$store.getters.current_account_token).
        then((response) => console.log(this.settings));
    }
  }
}
</script>

<style lang="scss" scoped>
* {
  color: white;
}

$primary-color: #407ee7;

.profile__save-button {
  width: 20%;
  background: none;
  border: 2px solid $primary-color;
  color: white;
  padding: 5px;
  font-size: 18px;
  cursor: pointer;
  margin: 12px 0;
  cursor: pointer;
}
</style>
