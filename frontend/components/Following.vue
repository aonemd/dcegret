<template>
    <div>
      <div v-for="account in accounts">
        <div class="row">
          <div class="col-2 col-m-4 center">
            <router-link :to="'/account/' + account.id" exact>
              <h3>
                <img src="https://via.placeholder.com/50">
                @{{ account.username }}
              </h3>
              <hr>
            </router-link>
          </div>
        </div>
      </div>
    </div>
</template>

<script>
import followApi from '../services/api/follow.js';

export default {
  data() {
    return {
      account_id: this.$route.params.id,
      accounts: []
    }
  },
  created() {
    followApi.all_following(this.account_id)
      .then(response => this.accounts = response.data.accounts);
  }
}
</script>

<style lang="scss" scoped>
a {
  text-decoration: none;
  color: white;
}

img {
  vertical-align: middle;
}
</style>
