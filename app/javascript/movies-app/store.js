import Vuex from 'vuex'
import Axios from 'axios'

const store = new Vuex.Store({
  state: {
    movies: [],
    movie: {}
  },
  mutations: {
    setMovies: function (state, movies) {
      state.movies = movies
    },
    setMovie: function (state, movie) {
      state.movie = movie
    }
  },
  actions: {
    setMovies: function (context) {
      Axios.get('/api/movies').then(function (data) {
        context.commit('setMovies', data.data)
      })
    },
    setMovie: function (context, id) {
      Axios.get('/api/movies/' + id).then(function (data) {
        context.commit('setMovie', data.data)
      })
    }
  },
  getters: {
    getMovies: function (state) {
      return state.movies
    },
    getMovie: function (state) {
      return state.movie.movie
    },
    getHalls: function (state) {
      return state.movie.halls
    },
    getShows: function (state) {
      return state.movie.shows
    }
  }
})

export default store
