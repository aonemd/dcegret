import axios from 'axios'

export default {
  signUp(email, username, password) {
    return axios.post('/api/v1/sign_up.json', {
      email,
      username,
      password
    });
  }
};
