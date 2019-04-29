<template>
  <div>
    <div class="row">
      <div class="col-4 col-m-6 center text-center">
        <div class="panel">
          <img src="https://via.placeholder.com/150">
          <h3>
            @{{ account.username }}
          </h3>
          <p>
          <router-link :to="'/account/' + account.id + '/following'" exact>
            Following ({{ account.following_count }})
          </router-link>
          |
          <router-link :to="'/account/' + account.id + '/followers'" exact>
            Followers ({{ account.follower_count }})
          </router-link>
          </p>
          <p>
          <input v-show="authenticated && !same_as_current_account" v-if="!currentAccountIsFollowing"
                                        v-on:click="follow(account.id)"
                                        type="button"
                                        class="follow-submit__button"
                                        value="Follow">
          <input v-show="authenticated && !same_as_current_account" v-else
                                        v-on:click="unfollow(account.id)"
                                        type="button"
                                        class="follow-submit__button"
                                        value="Unfollow">

          <input v-show="authenticated && !same_as_current_account"
                                        v-on:click="goToMessages(account.id)"
                                        type="button"
                                        class="follow-submit__button"
                                        value="Message">
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
                @{{ post.account.username }} . {{ post.created_at }}
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
import followApi from '../services/api/follow.js'

export default {
  data() {
    return {
      account_id: this.$route.params.id,
      account: {},
      currentAccountIsFollowing: false,
      posts: []
    }
  },
  computed: {
    authenticated() {
      return this.$store.getters.is_account_authenticated;
    },
    same_as_current_account() {
      return this.$store.getters.current_account_id == this.account_id;
    }
  },
  created() {
    api.show(this.account_id).then((response) => this.account = response.data.account);

    postsApi.account_all(this.account_id)
      .then((response) => this.posts = response.data.posts);

    followApi.is_following(this.account_id, this.$store.getters.current_account_token).
      then((response) => this.currentAccountIsFollowing = response.data.is_following);
  },
  methods: {
    follow: function(id)  {
      followApi.follow(id, this.$store.getters.current_account_token).
        then(() => {
          this.currentAccountIsFollowing = true;
          this.account.follower_count += 1;
        });
    },
    unfollow: function(id)  {
      followApi.unfollow(id, this.$store.getters.current_account_token).
        then(() => {
          this.currentAccountIsFollowing = false;
          this.account.follower_count -= 1;
        });
    },
    goToMessages: function(id) {
      this.$router.push({ path: '/message/' + id })
    }
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
  height: 400px;
  position: relative;
  color: white;

  a {
    color: white;
    text-decoration: none;
  }
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

$primary-color: #407ee7;

.follow-submit__button {
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
