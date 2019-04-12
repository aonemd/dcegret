<template>
  <div>
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
      posts: []
    }
  },
  created () {
    api.all().then((response) => this.posts = response.data.posts)
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
