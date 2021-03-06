import Vue from 'vue/dist/vue.esm';
import App from '../App.vue';
import router from '../router';
import store from "../store";

new Vue({
  el: '#app',
  render: h => h(App),
  router: router,
  store: store
});
