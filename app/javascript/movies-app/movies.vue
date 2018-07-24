<template>
  <div>
    <h1>Кинотеатр "Зачётная сосиска"</h1>
    <h4>Фильмы</h4>
    <div v-for="movie in movies">
      <div class="movie">
        <h1><b><router-link :to="'/movies/' + movie.id">{{ movie.title }}</router-link></b></h1>
        <p>
          <img :src="movie.image.cover.url">
        </p>
        <p>
          {{ movie.description }}
        </p>
        <p>
          {{ movie.adult_rating }}
        </p>
      </div>

    </div>
  </div>
</template>

<script>
  export default {
    data: function () {
      return {

      }
    },
    computed: {
      movies: function () {
        return this.$store.default.getters.getMovies
      }
    },
    created: function() {
      this.$store.default.dispatch('setMovies')
    }
  }
</script>
