<template>
  <div>
    <h1>Заказ билетов</h1>
    <div>
      <h2>{{ movie.title }}</h2>
      <h3 v-if="show.show_time" >Показ состоится {{ formattedShowTime(show.show_time) }}</h3>
      <img :src="movie.image.cover.url" v-if="movie.image"/>
    </div>
    
    <h4>{{ hall.title }}</h4>
    <table class="reservations-table" v-if="hall.size !== undefined" >
      <tr v-for="row in hall.size.rows" :key="row">
        <seat v-for="seat in hall.size.seats"
          :key="seat"
          :row="row"
          :seat="seat"
          :reserved="isReserved(row, seat)" />
      </tr>
    </table>
    <form v-on:submit.prevent="$router.push('order')">
      <p>
        <button type="submit">Заказать</button>
      </p>
    </form>
    
  </div>
</template>

<script>
  import Seat from './seat'
  import moment from 'moment'

  export default {
    
    components: {
      Seat
    },
    computed: {
      reservations: function () {
        return this.$store.default.getters.getReservations
      },
      hall: function () {
        return this.$store.default.getters.getHall
      },
      movie: function () {
        return this.$store.default.getters.getMovie
      },
      show: function () {
        return this.$store.default.getters.getShow
      }
    },
    methods: {
      formattedShowTime: function(time) {
        return moment(time).format('lll')
      },
      isReserved: function (row, seat) {
        for(let i=0; i < this.reservations.length; i++){
          if(this.reservations[i].row === row && this.reservations[i].seat === seat){
            return true
          }
        }
        return false
      }
    },
    created: function () {
      this.$store.default.dispatch('setShowInfo', this.$route.params.show)
    }
  }
</script>
