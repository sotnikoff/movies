<template>
  <div>
    <h1>Подтверждение Вашего заказа</h1>
    <h3>Ваш заказ</h3>
    <p>
      <strong>Фильм:</strong> {{ movie.title }}
    </p>
    <p>
      <strong>Показ: </strong> {{ formattedShowTime(show.show_time) }} в зале <strong>{{ hall.title }}</strong>
    </p>
    <p>
      <h3>Забронированные места</h3>
      <ul>
        <li v-for="seat in selectedSeats">
          Ряд {{ seat.row }}, место {{ seat.seat }}
        </li>
      </ul>
    </p>
    <h3>Введите Ваши данные</h3>
    <form v-on:submit.prevent="onSubmit">
      <p>
        <label for="name">Имя</label>
        <input type="name" id="name" v-model="name">
      </p>
      <p>
        <label for="email">Email</label>
        <input type="email" id="email" v-model="email">
      </p>
      <p>
        <label for="phone">Телефон</label>
        <input type="tel" id="phone" v-model="phone">
      </p>
      <p>
        <button type="submit">Заказать</button>
      </p>
    </form>
  </div>
</template>

<script>
  import moment from 'moment'

  export default {
    data: function (){
      return {
        email: '',
        phone: '',
        name: ''
      }
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
      },
      selectedSeats: function () {
        return this.$store.default.getters.getSelectedSeats
      }
    },
    methods: {
      formattedShowTime: function(time) {
        return moment(time).format('lll')
      },
      onSubmit: function () {
        const self = this
        this.$store.default.dispatch('createOrder', {email, phone, name})
          .then(function(){
            self.$store.default.dispatch('purgeSeats')
            self.$store.default.dispatch('setShowInfo', self.show.id)
              .then(function(){
                self.$router.push('/success')
              })
          }).catch(function(e){
            console.log(e)
          })
      },
    }
  }  
</script>
