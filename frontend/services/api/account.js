import axios from 'axios'

export default {
  all() {
    return axios.get('/api/v1/accounts.json');
  }
}

