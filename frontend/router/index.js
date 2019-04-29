import Vue from 'vue/dist/vue.esm';
import Router from 'vue-router';

import SignUp from '../components/SignUp.vue';
import SignIn from '../components/SignIn.vue';
import SignOut from '../components/SignOut.vue';
import Posts from '../components/Posts.vue';
import Accounts from '../components/Accounts.vue';
import Account from '../components/Account.vue';
import Messages from '../components/Messages.vue';
import Message from '../components/Message.vue';
import Following from '../components/Following.vue';
import Followers from '../components/Followers.vue';

import secured from '../services/secured';

Vue.use(Router)

const router = new Router({
  routes: [
    { path: '/sign-up', component: SignUp },
    { path: '/sign-in', component: SignIn },
    { path: '/sign-out', component: SignOut },
    { path: '/posts', component: Posts, meta: { auth: true } },
    { path: '/messages', component: Messages, meta: { auth: true } },
    { path: '/message/:id', component: Message, meta: { auth: true } },
    { path: '/community', component: Accounts, meta: { auth: true } },
    { path: '/account/:id/following', component: Following, meta: { auth: true } },
    { path: '/account/:id/followers', component: Followers, meta: { auth: true } },
    { path: '/account/:id', component: Account, meta: { auth: true } },
    { path: '/', component: Posts, meta: { auth: true } }
  ]
});

router.beforeEach((to, from, next) => {
  if (to.meta.auth) {
    if (!secured.authenticated()) {
      return next({ path: '/sign-in' });
    }
  }

  next();
});

export default router;
