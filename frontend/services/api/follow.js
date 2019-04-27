import axios from 'axios'

export default {
  all_following(id) {
    return axios.get('/api/v1/accounts/' + id + '/following' + '.json');
  },
  all_followers(id) {
    return axios.get('/api/v1/accounts/' + id + '/followers' + '.json');
  },
  follow(id, token) {
    return axios.post('/api/v1/accounts/relationships.json',
      { followed_id: id },
      { headers: { Authorization: 'Bearer ' + token } }
    );
  },
  unfollow(id, token) {
    return axios.delete('/api/v1/accounts/relationships/' + id + '.json',
      { headers: { Authorization: 'Bearer ' + token } }
    );
  },
  is_following(id, token) {
    return axios.get('/api/v1/accounts/relationships/' + id + '/is_following' + '.json',
      { headers: { Authorization: 'Bearer ' + token } }
    );
  }
}

