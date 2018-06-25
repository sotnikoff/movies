<template>
  <div>
    <h1>Кинотеатр "Зачётная сосиска"</h1>
    <h4>Фильмы</h4>
    <div v-for="movie in movies">
      <p><b><router-link :to="'/movies/' + movie.id">{{ movie.title }}</router-link></b></p>
      <p>
        {{ movie.description }}
      </p>
      <p>
        {{ movie.adult_rating }}
      </p>
    </div>
  </div>
</template>

<script>
  export default {
    data: function () {
      return {
        movies: []
      }
    },
    created: function() {
      this.getMovies()
    },
    methods: {
      getMovies: function () {
        this.$http.get('/api/movies').then(function (data) {
          this.movies = data.body
        })
      }
    }
  }
</script>
