export default {
  payload() {
    let token = localStorage.getItem('token');
    if (token === null)
      return { account_id: null, username: null };

    let hashed_payload = token.split('.')[1];
    let payload        = atob(hashed_payload);

    return JSON.parse(payload);
  },
  authenticated() {
    let payload = this.payload();
    if (payload != null) {
      return (payload['account_id'] != null);
    }
    else {
      return false;
    }
  }
}
