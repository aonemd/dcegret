import axios from 'axios'

export default {
  all(token) {
    return axios.get('/api/v1/conversations.json',
      { headers: { Authorization: 'Bearer ' + token } }
    );
  },
  show(id, token) {
    return axios.get('/api/v1/conversations/' + id + '.json',
      { headers: { Authorization: 'Bearer ' + token } }
    );
  },
  create(body, recipient_id, token) {
    return axios.post('/api/v1/conversations.json',
      { body: body, recipient_id: recipient_id },
      { headers: { Authorization: 'Bearer ' + token } }
    );
  }
}
