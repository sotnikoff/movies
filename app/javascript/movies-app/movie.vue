<template>
  <div v-if="movie">
    <h1>{{ movie.title }}</h1>
    <p>
      <img :src="movie.image.cover.url">
    </p>
    <blockquote>
      {{ movie.description }}
    </blockquote>
    <div class="shows" v-if="movie.shows.length > 0">
      <ul>
        <li v-for="show in movie.shows">
          {{ show.hall.title }} at {{ show.show_time }}
        </li>
      </ul>
    </div>
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
