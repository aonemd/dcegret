<template>
  <div>
    <div class="row">
      <div class="col-4 col-m-6 center text-center">
        Private Profile <input type="checkbox" v-model="settings.private_profile"></input>

        <br>
        <br>
        <br>

        <input type="button" class="profile__save-button" v-on:click="update" value="Save">
        <hr>

      </div>
    </div>
    <div v-for="account in requested_followers">
      <div class="row">
        <div class="col-4 col-m-6 center">
          <div class="left">
            <router-link :to="'/account/' + account.id" exact>
              @{{ account.username }}
            </router-link>
          </div>

          <div class="right">
            <input v-on:click="acceptRequest(account.id)"
                   type="button"
                   class="profile__save-button"
                   value="Accept">
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import accountApi from '../services/api/account.js';
import followApi from '../services/api/follow.js';

export default {
  data() {
    return {
      settings: {},
      requested_followers: []
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

    followApi.requested_followers(this.$store.getters.current_account_token).
      then((response) => this.requested_followers = response.data.accounts);
  },
  methods: {
    update: function() {
      accountApi.update_profile(this.settings, this.$store.getters.current_account_token).
        then((response) => console.log(this.settings));
    },
    acceptRequest: function(account_id) {
      followApi.accept_request(account_id, this.$store.getters.current_account_token).
        then((response) => location.reload());
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
  width: 100px;
  background: none;
  border: 2px solid $primary-color;
  color: white;
  padding: 5px;
  font-size: 18px;
  cursor: pointer;
  margin: 12px 0;
  cursor: pointer;
}

a {
  color: white;
  text-decoration: none;
}
</style>
