import axios from 'axios'

export default {
  all() {
    return axios.get('/api/v1/accounts.json');
  },
  show(id) {
    return axios.get('/api/v1/accounts/' + id + '.json');
  },
  fetch_settings(token) {
    return axios.get('/api/v1/accounts/settings.json',
      { headers: { Authorization: 'Bearer ' + token } }
    );
  },
  update_profile(settings, token) {
    return axios.put('/api/v1/accounts/settings.json',
      { settings: settings },
      { headers: { Authorization: 'Bearer ' + token } }
    );
  }
}
