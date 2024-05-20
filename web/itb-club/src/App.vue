<template>
  <header>
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
import { RouterLink, RouterView } from 'vue-router';
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
