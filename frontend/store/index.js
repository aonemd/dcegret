import Vue from 'vue/dist/vue.esm';
import Vuex from 'vuex';

import secured from '../services/secured';

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
  },
  getters: {
    is_account_authenticated: (state) => {
      return secured.authenticated();
    },
    current_account_username: (state) => {
      return secured.payload()['username'];
    },
    current_account_id: (state) => {
      return secured.payload()['account_id'];
    },
    current_account_token: (state) => {
      return localStorage.getItem('token');
    }
  }
});
