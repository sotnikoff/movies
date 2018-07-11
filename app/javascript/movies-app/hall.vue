<template>
  <div class="hall">
    <h4>Сеансы в залах</h4>
    <h5>{{ hall.title }}</h5>
    <ul>
      <li v-for="show in filterShows">
        {{ formattedShowTime(show.show_time) }}
      </li>
    </ul>
  </div>
</template>

<script>
  import moment from 'moment'

  export default {
    props: ['hall','shows'],
    data: function () {
      return {
        message: 'hall'
      }
    },
    methods: {
      formattedShowTime: function(time) {
        return moment(time).format('lll')
      }
    },
    computed: {
      filterShows: function () {
        let self = this
        return this.shows.filter(function (s){
          return s.hall_id === self.hall.id
        })
      }
    }
  }
</script>
