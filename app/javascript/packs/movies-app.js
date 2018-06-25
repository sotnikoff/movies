import Vue from 'vue'
import App from '../movies-app/app.vue'
import Movie from '../movies-app/movie'
import Movies from '../movies-app/movies'
import VueResource from 'vue-resource'
import VueRouter from 'vue-router'

const routes = [
  { path: '/movies/:id', component: Movie },
  { path: '/', component: Movies }
]

const router = new VueRouter({
  routes
})

const el = document.getElementById('app')
Vue.use(VueResource)
Vue.use(VueRouter)
Vue.http.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content')
new Vue({
  el,
  router,
  render: h => h(App)
})
