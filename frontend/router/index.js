import Vue from 'vue/dist/vue.esm';
import Router from 'vue-router';

import SignUp from '../components/SignUp.vue';
import SignIn from '../components/SignIn.vue';
import SignOut from '../components/SignOut.vue';
import Posts from '../components/Posts.vue';

Vue.use(Router)

export default new Router({
  routes: [
    { path: '/sign-up', component: SignUp },
    { path: '/sign-in', component: SignIn },
    { path: '/sign-out', component: SignOut },
    { path: '/posts', component: Posts },
    { path: '/', component: Posts }
  ]
});
