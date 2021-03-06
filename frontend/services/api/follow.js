import axios from 'axios'

export default {
  all_following(id, token) {
    return axios.get('/api/v1/accounts/' + id + '/following' + '.json',
      { headers: { Authorization: 'Bearer ' + token } }
    );
  },
  all_followers(id, token) {
    return axios.get('/api/v1/accounts/' + id + '/followers' + '.json',
      { headers: { Authorization: 'Bearer ' + token } }
    );
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
  },
  requested_followers(token) {
    return axios.get('/api/v1/accounts/requested_followers.json',
      { headers: { Authorization: 'Bearer ' + token } }
    );
  },
  accept_request(account_id, token) {
    return axios.put('api/v1/accounts/' + account_id + '/accept_request.json',
      {},
      { headers: { Authorization: 'Bearer ' + token } }
    );
  }
}

