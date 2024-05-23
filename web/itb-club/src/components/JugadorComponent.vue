<template>
    <div class="player-container">
      <p>{{ playerData ? playerData.name : 'Vacant' }}</p>
      <div v-if="true" class="admin-teamates">
        <button class="button" @click="deletePlayer">Eliminar</button>
      </div>
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
      }, 
      deletePlayer(){

      }
    },
    mounted() {
      this.getPlayerData();
    }
  };
  </script>
  
  <style>
  .player-container{
    padding: 1em;
    border-radius: 1em;
    background-color: #eff9f6;
    margin: 0.25em 0em;
    display: flex;
    justify-content: space-between;

  }

  </style>
  