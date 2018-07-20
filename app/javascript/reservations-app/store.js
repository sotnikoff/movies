import Vuex from 'vuex'
import Axios from 'axios'

const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content')
Axios.defaults.headers.common['X-CSRF-Token'] = csrfToken

const store = new Vuex.Store({
  state: {
    
  },
  mutations: {
    
  },
  actions: {
    createOrder: function (context, data) {
      Axios.post('/api/create_order', {order: data})
    }
  },
  getters: {
    
  }
})

export default store
