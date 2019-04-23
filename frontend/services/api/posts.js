import axios from 'axios'

export default {
  all() {
    return axios.get('/api/v1/timeline.json');
  },
  authenticated_all(token) {
    return axios.get('/api/v1/accounts/posts.json',
      { headers: { Authorization: 'Bearer ' + token } }
    );
  },
  create(content, token) {
    return axios.post('/api/v1/accounts/posts.json',
      { post: { content: content } },
      { headers: { Authorization: 'Bearer ' + token } }
    );
  }
}
