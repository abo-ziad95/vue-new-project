import Vue from 'vue';
import App from './App.vue';
import {routes} from './router';
import store from './store/store';
import VeeValidate from 'vee-validate';


Vue.use(VeeValidate, {
  classes: true,
  delay: 0,
  events: 'input|blur',
});

Vue.use(vueRouter);
Vue.config.productionTip = false;

const router = new vueRouter({
  mode: 'history',
  routes,
});

new Vue({
  render: h => h(App),
  router,
  store,
}).$mount('#app')
