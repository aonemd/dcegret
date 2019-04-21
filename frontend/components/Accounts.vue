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
            </router-link>
          </div>
        </div>
      </div>
    </div>
</template>

<script>
import api from '../services/api/account.js';

export default {
  data() {
    return {
      accounts: []
    }
  },
  created() {
    api.all().then((response) => this.accounts = response.data.accounts);
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
