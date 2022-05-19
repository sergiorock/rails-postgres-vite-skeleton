<template>
  <h1>Hello From {{ componentName }} component</h1>
  <button @click="count++">Count is: {{ count }}</button>
  <br>
  <Example />

</template>

<script>
import Example from './components/Example.vue'

export default {
  data() {
    return {
      componentName: 'App',
      count: 0
    }
  },
  components: {
    Example
  }
}
</script>

<style scoped>
button {
  font-weight: bold;
}
</style>