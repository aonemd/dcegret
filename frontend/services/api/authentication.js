import axios from 'axios'

export default {
  signUp(email, username, password) {
    return axios.post('/api/v1/sign_up.json', {
      email,
      username,
      password
    });
  },
  signIn(identity, password) {
    return axios.post('/api/v1/sign_in.json', {
      identity,
      password
    });
  }
};
