import Vue from 'vue/dist/vue.esm';
import Vuex from 'vuex';

import secured from '../services/secured';

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    authenticated: false,
    account_username: ''
  },
  getters: {
    is_account_authenticated: (state) => {
      return secured.authenticated();
    },
    current_account_username: (state) => {
      return secured.payload()['username'];
    }
  }
});
