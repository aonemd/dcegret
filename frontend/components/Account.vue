<template>
  <div>
    <div class="row">
      <div class="col-4 col-m-6 center text-center">
        <div class="panel">
          <img src="https://via.placeholder.com/150">
          <h3>
            Full Name
          </h3>
          <p>
          Follwoing (69) | Followers (69)
          </p>
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
      account_id: this.$route.params.id,
      account: {}
    }
  },
  created() {
    api.show(this.account_id).then((response) => this.account = response.data.account);
  }
}
</script>

<style lang="scss" scoped>
.panel {
  width: 100%;
  padding: 30px;
  background: #262626;
  margin-top: -30px;
  border-bottom: 1px solid #191919;
  height: 350px;
  position: relative;
  color: white;
}
</style>
