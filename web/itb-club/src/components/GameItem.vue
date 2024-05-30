<template>
<p>Esto es un juego</p>
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
  