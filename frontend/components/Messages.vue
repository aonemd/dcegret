<template>
  <div>
    <div v-for="conversation in conversations">
      <div class="row">
        <div class="col-4 col-m-6 center text-center">
          <router-link :to="'/message/' + conversation.id" exact>
            with @{{ conversation.with }} . {{ conversation.created_at }}
          </router-link>
          <hr>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import api from '../services/api/messages.js';

export default {
  data() {
    return {
      conversations: [],
    }
  },
  created() {
    api.all(this.$store.getters.current_account_token)
      .then((response) => this.conversations = response.data.conversations);
  }
}
</script>

<style lang="scss" scoped>
a {
  text-decoration: none;
  color: white;
}
</style>
