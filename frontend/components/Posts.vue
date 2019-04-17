<template>
  <div class="row">
    <div class="col-4 col-m-6 center">
      <div v-show="authenticated" id="posts__add-post-form">
        <post-editor
          :max-characters="180"
          rows="4"
          v-model="postContent">
        </post-editor>

        <post-submit-button v-on:click.native="submitNewPost"></post-submit-button>
      </div>

      <div v-for="post in posts">
        <div class="post">
          <h1>
            {{ post.content }}
          </h1>
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
      postContent: ''
    }
  },
  computed: {
    authenticated() {
      return this.$store.getters.is_account_authenticated;
    }
  },
  created() {
    api.all().then((response) => this.posts = response.data.posts);
  },
  methods: {
    submitNewPost: function () {
      api.create(this.postContent, this.$store.getters.current_account_token).then((response) => {
        this.posts.unshift({ content: this.postContent });
      });
    }
  }
}
</script>

<style scoped>
.post {
  background: #eee;
  margin: 10px auto;
  padding: 2px;
  width: 500px;
  height: 200px;
  text-align: center;
}

#posts__add-post-form {
  margin-bottom: 100px;
}
</style>
