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
    },
    selectedSeats: []
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
    },
    addSeat: function (state, seat) {
      const obj = state.selectedSeats.find(function(s){
        return s.row === seat.row && s.seat === seat.seat
      })
      if(obj === undefined){
        state.selectedSeats.push(seat)
      }
    },
    removeSeat: function (state, seat) {
      const index = state.selectedSeats.findIndex(function(s){
        return s.row === seat.row && s.seat === seat.seat
      })
      if(index !== undefined){
        state.selectedSeats.splice(index, 1)
      }
    },
    purgeSeats: function (state) {
      state.selectedSeats = []
    }
  },
  actions: {
    createOrder: function (context, data) {
      const seats = this.getters.getSelectedSeats

      if(seats.length === 0){
        alert('Empty!')
        return false
      }

      Axios.post('/api/create_order', {
        order: {
          email: data.email._value,
          phone: data.phone._value,
          reservations_attributes: seats
        }
      })
    },
    setShowInfo: function (context, show) {
      Axios.get('/api/shows/'+show)
        .then(function(data) {
          context.commit('setMovie',data.data.movie)
          context.commit('setReservations',data.data.reservations)
          context.commit('setHall',data.data.hall)
          context.commit('setShow',data.data.show)
      })
    },
    purgeSeats: function (context) {
       context.commit('purgeSeats')
    },
    select: function (context, seat) {
      if(this.getters.isSelected(seat)){
        context.commit('removeSeat', seat)
      }else{
        context.commit('addSeat', seat)
      }
    }
  },
  getters: {
    getReservations: function (state) {
      return state.show.reservations
    },
    getHall: function (state) {
      return state.show.hall
    },
    getShow: function (state) {
      return state.show.show
    },
    getMovie: function (state) {
      return state.show.movie
    },
    getSelectedSeats: function (state) {
      return state.selectedSeats
    },
    isSelected: function (state) {
      return function (seat) {
        const obj = state.selectedSeats.find(function(s){
          return s.row === seat.row && s.seat === seat.seat
        })
        if(obj === undefined){
          return false
        }else{
          return true
        }
      }
    }
  }
})

export default store
