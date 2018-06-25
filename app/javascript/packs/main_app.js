import Vue from 'vue'
import App from '../main_app/app.vue'
import VueResource from 'vue-resource'

const el = document.getElementById('app')
Vue.use(VueResource)
Vue.http.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content')
const app = new Vue({
  el,
  render: h => h(App)
})
