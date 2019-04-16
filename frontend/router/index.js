import Vue from 'vue/dist/vue.esm';
import Router from 'vue-router';

import Posts from '../components/Posts.vue';
import SignUp from '../components/SignUp.vue';

Vue.use(Router)

export default new Router({
  routes: [
    { path: '/sign-up', component: SignUp },
    { path: '/posts', component: Posts },
    { path: '/', component: Posts }
  ]
});
