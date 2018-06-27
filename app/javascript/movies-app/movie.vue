<template>
  <div v-if="movie">
    <h1>{{ movie.title }}</h1>
    <p>
      <img :src="movie.image.cover.url">
    </p>
    <blockquote>
      {{ movie.description }}
    </blockquote>
  </div>
</template>

<script>
  export default {
    data: function () {
      return {
        movie: null
      }
    },
    created: function() {
      this.getMovie()
    },
    methods: {
      getMovie: function () {
        this.$http.get('/api/movies/' + this.$route.params.id).then(function (data) {
          this.movie = data.body
        })
      }
    }
  }
</script>
