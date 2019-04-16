import Vue from 'vue/dist/vue.esm';
import Router from 'vue-router';
import Posts from '../components/Posts.vue';

Vue.use(Router)

export default new Router({
  routes: [
    { path: '/posts', component: Posts },
    { path: '/', component: Posts }
  ]
})
