<template>
  <div>
    <h1>{{ hall.title }}</h1>
    <table class="reservations-table">
      <tr v-for="row in hallSeats.rows">
        <td v-for="seat in row.seats"
          class="seat" v-bind:class="{selected: seat.selected, reserved: seat.reserved}"
          v-on:click="selectSeat(seat)">
        </td>
      </tr>
    </table>
    <form v-on:submit.prevent="onSubmit">
      <p>
        <label for="email">Email</label>
        <input type="email" id="email" v-model="order.email">
      </p>
      <p>
        <label for="phone">Phone</label>
        <input type="tel" id="phone" v-model="order.phone">
      </p>
      <p>
        <button type="submit">Заказать</button>
      </p>
    </form>
    
  </div>
</template>

<script>
  export default {
    data: function (){
      return {
        hallSeats: {
          rows: []
        },
        show: {

        },
        movie: {

        },
        order: {
          email: '',
          phone: '',
          show_id: 1,
          ordered_seats: []
        }
      }
    },
    computed: {
      reservations: function () {
        return this.$store.default.getters.getReservations
      },
      hall: function () {
        return this.$store.default.getters.getHall
      }
    },
    methods: {
      getThis: function () {
        return this
      },
      gererateHallGridObject: function () {
        console.log(this.hall)
        for(let r = 1; r <= this.hall.size.rows; r++){
          let row = { seats: [], row: r }
          for(let s = 1; s <= this.hall.size.seats; s++){
            let reserved = false
            const reservedObj = this.reservations.find(function(res){
              return res.row === r && res.seat === s
            })
            if(reservedObj !== undefined){
              reserved = true
            }
            let seat = { row: r, seat: s, selected: false, reserved: reserved }
            row.seats.push(seat)
          }
          this.hallSeats.rows.push(row)
        }
      },
      selectSeat: function (seat) {
        if(!seat.reserved){
          seat.selected = !seat.selected
        }
      },
      getOrderedSeats: function () {
        this.order.ordered_seats = []
        for(let r = 0; r < this.hallSeats.rows.length; r++){
          for(let s = 0; s < this.hallSeats.rows[r].seats.length; s++){
            if(this.hallSeats.rows[r].seats[s].selected === true){
              this.order.ordered_seats.push(this.hallSeats.rows[r].seats[s])
            }
          }
        }
      },
      onSubmit: function () {
        this.getOrderedSeats()
        this.$store.default.dispatch('createOrder', this.order)
      },
      onSubmitClick: function () {

      }
    },
    created: function () {
      this.$store.default.dispatch('setShowInfo', this.$route.params.show)
        .then(function () {
          this.gererateHallGridObject()
        })
    }
  }
</script>
