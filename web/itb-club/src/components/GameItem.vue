<template>
<p>Esto es un juego {{ game.id }}</p>
<div v-if="!displayButtons">
    <p>Selecciona el guanyador:</p>
    <button @click="clickTeam1">Equip 1</button>
    <button @click="clickTeam2">Equip 2</button>
</div>

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
  data(){
    return{
        displayButtons:false,
    }
  },
  methods:{
    clickTeam1() {
            this.$emit("selected-winner", [1, this.game.tournament_position]);
            this.displayButtons=false;
        }, 
    clickTeam2() {
        this.$emit("selected-winner", [2, this.game.tournament_position]);
        this.displayButtons=false;
    }
  }
};
  </script>
  
  <style>

  </style>
  