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
      <h4>Сеансы в залах</h4>
      <hall :hall="hall" :shows="shows" v-for="hall in halls" :key="hall.id" />
    </div>
  </div>
</template>

<script>
  import Hall from './hall'

  export default {
    components: {
      'hall': Hall
    },
    computed: {
      movie: function () {
        return this.$store.default.getters.getMovie
      },
      halls: function () {
        return this.$store.default.getters.getHalls
      },
      shows: function () {
        return this.$store.default.getters.getShows
      }
    },
    data: function () {
      return {

      }
    },
    created: function() {
      this.$store.default.dispatch('setMovie', this.$route.params.id)
    },
  }
</script>
