import Vue from 'vue';
import Vuex from 'vuex';
import axios from 'axios';

Vue.use(Vuex);

axios.interceptors.response.use(function (response) {
  // Do something with response data
  // store.commit('loadingStop');
  return response;
}, function (error) {
  console.log('err', error.response);
  // Do something with response error
  return Promise.reject(error);
});

axios.defaults.baseURL = process.env.VUE_APP_API_URL;

const store = new Vuex.Store({
  modules: {
  },
});
export default store;
