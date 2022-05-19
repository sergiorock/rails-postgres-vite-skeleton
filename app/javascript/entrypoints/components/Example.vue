<template>
  <h1>Hello From {{ componentName }} component</h1>

</template>

<script>
export default {
  data() {
    return {
      componentName: 'Example'
    }
  }
}
</script>

<style scoped>
button {
  font-weight: bold;
}
</style>