<script setup>
import HelloWorld from './components/HelloWorld.vue'
</script>

<template>
  <header>
    <h1>ITBCLUB</h1>
    <router-link to="/about">My about component</router-link>
  </header>
  <main><p>Esto es el main</p></main>

</template>

<style scoped>
a:hover,
a:active,
a.router-link-a {
  color: #42b983;
  border-color: #42b983;
  background-color: blue;}
</style>
