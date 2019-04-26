import Vue from 'vue/dist/vue.esm';
import Router from 'vue-router';

import SignUp from '../components/SignUp.vue';
import SignIn from '../components/SignIn.vue';
import SignOut from '../components/SignOut.vue';
import Posts from '../components/Posts.vue';
import Accounts from '../components/Accounts.vue';
import Account from '../components/Account.vue';
import Following from '../components/Following.vue';
import Followers from '../components/Followers.vue';

Vue.use(Router)

export default new Router({
  routes: [
    { path: '/sign-up', component: SignUp },
    { path: '/sign-in', component: SignIn },
    { path: '/sign-out', component: SignOut },
    { path: '/posts', component: Posts },
    { path: '/community', component: Accounts },
    { path: '/account/:id/following', component: Following },
    { path: '/account/:id/followers', component: Followers },
    { path: '/account/:id', component: Account },
    { path: '/', component: Posts }
  ]
});
