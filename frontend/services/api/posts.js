import axios from 'axios'

export default {
  all() {
    return axios.get('/api/v1/posts.json');
  },
  create(post) {
    return axios.post('/api/v1/posts.json', post)
  }
}
