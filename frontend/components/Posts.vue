<template>
  <div>
    <div class="row">
      <div class="col-4 col-m-6 center">
        <div v-show="authenticated" id="posts__add-post-form">
          <div class="posts__post-panel">
            <post-editor
              :max-characters="180"
              rows="4"
              v-model="postContent">
            </post-editor>

            <br>

            Private Post <input type="checkbox" v-model="postIsPrivate"></input>
            <post-submit-button v-on:click.native="submitNewPost"></post-submit-button>
          </div>
        </div>
      </div>
    </div>

    <div v-for="post in posts">
      <div class="row">
        <div class="col-4 col-m-6 center">
          <div class="posts__post-panel">
            <div class="posts_post-owner-info left">
              <img src="https://via.placeholder.com/50">
              <router-link :to="'/account/' + post.account.id" exact>
                @{{ post.account.username }}
              </router-link>
              . {{ post.created_at }}
            </div>

            <br>
            <br>

            <div class="posts__post-content left">
              {{ post.content }}
            </div>

            <br>
            <br>

            <div class="posts__post-options">
              <input type="button" class="like-button" v-on:click="love(post.id)" value="Love" v-if="!post.like_id">
              <input type="button" class="like-button" v-on:click="unlove(post.id, post.like_id)" value="Unlove" v-else>
              {{ post.likes_count }}
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import api from '../services/api/posts.js';
import PostEditor from './posts/PostEditor';
import PostSubmitButton from './posts/PostSubmitButton';


export default {
  components: {
    'post-editor': PostEditor,
    'post-submit-button': PostSubmitButton
  },
  data() {
    return {
      posts: [],
      postContent: '',
      postIsPrivate: false
    }
  },
  computed: {
    authenticated() {
      return this.$store.getters.is_account_authenticated;
    }
  },
  created() {
    api.all(this.$store.getters.current_account_token).then((response) => this.posts = response.data.posts);
  },
  methods: {
    submitNewPost: function () {
      api.create(this.postContent, this.postIsPrivate, this.$store.getters.current_account_token).then((response) => {
        this.posts.unshift(response.data.post);
      });
    },
    love: function(id) {
      api.like(id, this.$store.getters.current_account_token).then((response) => {
        location.reload();
      });
    },
    unlove: function(id, like_id) {
      api.unlike(id, like_id, this.$store.getters.current_account_token).then((response) => {
        location.reload();
      });
    }
  }
}
</script>

<style lang="scss" scoped>
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

  a {
    color: white;
    text-decoration: none;
  }
}

.like-button {
  padding: 0;
  border: 0;
  background-color: transparent;
  color: white;
  cursor: pointer;
}
</style>
