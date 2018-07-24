<template>
  <div>
    <h1>Спасибо за заказ</h1>
    <h3>Ваш заказ № {{ orderID }}</h3>
    <a href="/">На главную</a>
  </div>
</template>

<script>
  export default {
    computed: {
      orderID: function () {
        return this.$store.default.getters.getOrderID
      }
    }
  }
</script>
