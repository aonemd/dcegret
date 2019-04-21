<template>
</template>

<script>
import api from '../services/api/account.js';

export default {
  data() {
    return {
      account_id: this.$route.params.id,
      account: {}
    }
  },
  created() {
    api.show(this.account_id).then((response) => this.account = response.data.account);
  }
}
</script>
