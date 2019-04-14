<template>
  <div>
    <div id="posts__add-post-form">
      <textarea placeholder="Post something..." v-model="postContent"></textarea>
      <button v-on:click="addNewPost">Add</button>
    </div>

    <div v-for="post in posts">
      <div class="post">
        <h1>
          {{ post.content }}
        </h1>
      </div>
    </div>
  </div>
</template>

<script>
import api from '../services/api/posts.js'

export default {
  data() {
    return {
      posts: [],
      postContent: ''
    }
  },
  created () {
    api.all().then((response) => this.posts = response.data.posts);
  },
  methods: {
    addNewPost: function () {
      api.create(this.postContent).then((response) => {
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
</style>
