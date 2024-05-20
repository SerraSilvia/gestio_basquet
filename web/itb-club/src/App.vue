<template>
  <HeaderComponent></HeaderComponent>
  <main>
    <RouterView/>
  </main>
</template>

<script setup>
import { RouterLink, RouterView } from 'vue-router';
import HeaderComponent from './components/HeaderComponent.vue'

</script>

<style scoped>

a:hover,
a:active,
a.router-link-active {
  color: #42b983;
  border-color: #42b983;
  background-color: blue;
}
</style>
