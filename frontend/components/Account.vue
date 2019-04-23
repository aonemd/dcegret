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

      <div v-for="post in posts">
        <div class="row">
          <div class="col-4 col-m-6 center text-center">
            <div class="posts__post-panel">
              <div class="posts_post-owner-info left">
                <img src="https://via.placeholder.com/50">
                @username . 17-04-2019
              </div>

              <br>
              <br>

              <div class="posts__post-content left">
                {{ post.content }}
              </div>

              <br>
              <br>

              <div class="posts__post-options">
                Rechirp | Love
              </div>
            </div>
          </div>
        </div>
    </div>
  </div>
</template>

<script>
import api from '../services/api/account.js';
import postsApi from '../services/api/posts.js';

export default {
  data() {
    return {
      account_id: this.$route.params.id,
      account: {},
      posts: []
    }
  },
  created() {
    api.show(this.account_id).then((response) => this.account = response.data.account);

    postsApi.authenticated_all(this.$store.getters.current_account_token)
      .then((response) => this.posts = response.data.posts);
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

.posts__post-panel {
  width: 100%;
  padding: 30px;
  background: #262626;
  margin-top: -30px;
  border-bottom: 1px solid #191919;
  height: 300px;
  position: relative;
  color: white;

  .posts_post-owner-info {
    vertical-align: middle;

    img {
      width: 50px;
      height: 50px;
      vertical-align: middle;
    }
  }

  .posts__post-content {
    margin-top: 20px;
  }

  .posts__post-options {
    position: absolute;
    bottom: 10px;
    left: 10px;
  }
}
</style>
