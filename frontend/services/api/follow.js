import axios from 'axios'

export default {
  all_following(id) {
    return axios.get('/api/v1/accounts/' + id + '/following' + '.json');
  },
  all_followers(id) {
    return axios.get('/api/v1/accounts/' + id + '/followers' + '.json');
  }
}

