<template>
  <div>
    <h1>Подтверждение Вашего заказа</h1>
    <h3>Ваш заказ</h3>
    <p>
      <strong>Фильм:</strong> {{ movie.title }}
    </p>
    <h3>Введите Ваши данные</h3>
    <form>
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
    </form>
  </div>
</template>

<script>
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
    },
    methods: {
      onSubmit: function () {
        const self = this
        this.$store.default.dispatch('createOrder', {email, phone, name})
          .then(function(){
            self.$store.default.dispatch('purgeSeats')
            self.$store.default.dispatch('setShowInfo', self.$route.params.show)
          }).catch(function(e){
            console.log(e)
          })
      },
    }
  }  
</script>
