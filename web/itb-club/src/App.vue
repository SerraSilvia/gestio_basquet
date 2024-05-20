<template>
  <header>
    <h1>ITBCLUB</h1>
    <nav>
      <RouterLink to="/">Go to Home</RouterLink>
      <RouterLink to="/about">My about component</RouterLink>
    </nav>
    
  </header>
  <main>
    <RouterView/>
  </main>

</template>

<script setup>
import HelloWorld from './components/HelloWorld.vue'
</script>

<style scoped>
a:hover,
a:active,
a.router-link-a {
  color: #42b983;
  border-color: #42b983;
  background-color: blue;}
</style>
