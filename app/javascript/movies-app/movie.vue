<template>
  <div v-if="movie">
    <h1>{{ movie.title }}</h1>
    <p>
      <img :src="movie.image.cover.url">
    </p>
    <blockquote>
      {{ movie.description }}
    </blockquote>
    <div class="halls">
      <hall :hall="hall" :shows="shows" v-for="hall in halls" />
    </div>
  </div>
</template>

<script>
  import Hall from './hall'

  export default {
    components: {
      'hall': Hall
    },
    data: function () {
      return {
        movie: null,
        shows: [],
        halls: []
      }
    },
    created: function() {
      this.getMovie()
    },
    methods: {
      getMovie: function () {
        this.$http.get('/api/movies/' + this.$route.params.id)
          .then(function (data) {
            this.movie = data.body.movie
            this.shows = data.body.shows
            this.halls = data.body.halls
          })
      }
    }
  }
</script>
