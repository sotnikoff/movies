import Vue from 'vue'
import App from '../reservations-app/app'
import VueRouter from 'vue-router'
import Vuex from 'vuex'
import Reservations from '../reservations-app/reservations'
import HallReservation from '../reservations-app/hall-reservation'
import Order from '../reservations-app/order'

const el = document.getElementById('app')

const routes = [
  { path: '/', component: Reservations },
  { path: '/order', component: Order},
  { path: '/:show', component: HallReservation }
]

const router = new VueRouter({
  routes
})

Vue.use(VueRouter)
Vue.use(Vuex)

const store = require('../reservations-app/store')

new Vue({
  el,
  router,
  store,
  render: function (render){
    return render(App)
  }
})
