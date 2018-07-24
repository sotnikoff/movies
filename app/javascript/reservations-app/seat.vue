<template>
  <td v-on:click.prevent="onClick"
    class="seat"
    :class="{selected, reserved}">
  </td>
</template>

<script>
  export default {
    props: ['row','seat','reserved'],
    methods: {
      onClick: function () {
        if(!this.reserved){
          this.$store.default.dispatch('select', {row: this.row, seat: this.seat, show_id: this.showID})
        }
      }
    },
    computed: {
      showID: function () {
        return this.$store.default.getters.getShow.id
      },
      selected: function () {
        return this.$store.default.getters.isSelected({row: this.row, seat: this.seat})
      }
    }
  }
</script>
