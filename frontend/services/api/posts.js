import axios from 'axios'

export default {
  all(token) {
    return axios.get('/api/v1/posts.json',
      { headers: { Authorization: 'Bearer ' + token } }
    );
  },
  authenticated_all(token) {
    return axios.get('/api/v1/accounts/posts.json',
      { headers: { Authorization: 'Bearer ' + token } }
    );
  },
  account_all(id) {
    return axios.get('/api/v1/posts/' + id + '/by_account.json'
    );
  },
  create(content, isPrivate, token) {
    return axios.post('/api/v1/accounts/posts.json',
      { post: { content: content, private: isPrivate } },
      { headers: { Authorization: 'Bearer ' + token } }
    );
  },
  like(post_id, token) {
    return axios.post('/api/v1/posts/' + post_id + '/likes.json',
      {},
      { headers: { Authorization: 'Bearer ' + token } }
    );
  },
  unlike(post_id, id, token) {
    return axios.delete('/api/v1/posts/' + post_id + '/likes/' + id + '.json',
      { headers: { Authorization: 'Bearer ' + token } }
    );
  }
}
