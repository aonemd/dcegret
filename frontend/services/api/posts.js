import axios from 'axios'

export default {
  all() {
    return axios.get('/api/v1/timeline.json');
  },
  create(post) {
    return axios.post('/api/v1/posts.json', post)
  }
}
