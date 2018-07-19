import Vue from 'vue'
import App from '../reservations-app/app'
import VueRouter from 'vue-router'
import Reservations from '../reservations-app/reservations'
import HallReservation from '../reservations-app/hall-reservation'

const el = document.getElementById('app')

const routes = [
  { path: '/', component: Reservations },
  { path: '/:show', component: HallReservation }
]

const router = new VueRouter({
  routes
})

Vue.use(VueRouter)

new Vue({
  el,
  router,
  render: function (render){
  	return render(App)
  }
})
