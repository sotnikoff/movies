import Vue from 'vue'
import App from '../movies-app/app.vue'
import Movie from '../movies-app/movie'
import Movies from '../movies-app/movies'
import VueResource from 'vue-resource'
import VueRouter from 'vue-router'
import Vuex from 'vuex'

const routes = [
  { path: '/movies/:id', component: Movie },
  { path: '/movies', component: Movies },
  { path: '/', component: Movies }
]

const router = new VueRouter({
  routes
})

const el = document.getElementById('app')
Vue.use(VueResource)
Vue.use(VueRouter)
Vue.use(Vuex)

const store = require('../movies-app/store')

Vue.http.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content')
new Vue({
  el,
  router,
  store,
  render: h => h(App)
})
