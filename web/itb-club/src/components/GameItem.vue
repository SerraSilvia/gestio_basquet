<template>
<p>Esto es un juego {{ game.id }}</p>
</template>
  <script>
  
  export default {
    name: "GameItem", 
    props: {
    game: {
      type: Object,
      required: true
    }
  },
};
  </script>
  
  <style>

  </style>
  