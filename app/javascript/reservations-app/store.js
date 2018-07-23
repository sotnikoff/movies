import Vuex from 'vuex'
import Axios from 'axios'

const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content')
Axios.defaults.headers.common['X-CSRF-Token'] = csrfToken

const store = new Vuex.Store({
  state: {
    show: {
      show: {},
      hall: {},
      reservations: [],
      movie: {}
    }
  },
  mutations: {
    setMovie: function (state, movie) {
      state.show.movie = movie
    },
    setHall: function (state, hall) {
      state.show.hall = hall
    },
    setReservations: function (state, reservations) {
      state.show.reservations = reservations
    },
    setShow: function (state, show) {
      state.show.show = show
    }
  },
  actions: {
    createOrder: function (context, data) {
      Axios.post('/api/create_order', {order: data})
    },
    setShowInfo: function (context, show) {
      Axios.get('/api/shows/'+show)
        .then(function(data) {
          context.commit('setMovie',data.data.movie)
          context.commit('setReservations',data.data.reservations)
          context.commit('setHall',data.data.hall)
      })
    }
  },
  getters: {
    getReservations: function (state) {
      return state.show.reservations
    },
    getHall: function (state) {
      return state.show.hall
    }
  }
})

export default store
