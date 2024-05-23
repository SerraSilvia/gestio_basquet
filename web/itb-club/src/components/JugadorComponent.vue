<template>
    <div>
      <p class="player">Esto es un jugador: {{ playerData ? playerData.name : 'Cargando...' }}</p>
    </div>
  </template>
  
  <script>
  import axios from 'axios';
  
  export default {
    name: 'JugadorComponent',
    props: {
      player: {
        type: Number,
        required: true
      }
    },
    data() {
      return {
        playerData: null,
      }
    },
    methods: {
      getPlayerData() {
        axios.get('http://localhost/gestio_basquet/api/routes/people/?id=' + this.player)
          .then(response => {
            console.log(response.data);
            this.playerData = response.data[0];
          })
          .catch(error => {
            console.error('Error al obtener datos del jugador:', error);
          });
      }
    },
    mounted() {
      this.getPlayerData();
    }
  };
  </script>
  
  <style>
  .player {
    background-color: red;
  }
  </style>
  