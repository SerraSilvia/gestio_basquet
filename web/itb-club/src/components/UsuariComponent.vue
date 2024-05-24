<template>
    <div id="user-manager-page">
      <h2>Hola {{ user ? user.name : 'Usuari' }}</h2>
      <div class="user-manager-container">
        <section>
          <h3>Les teves dades</h3>
          <button>Modificar</button>
        </section>
        <section>
          <h3>El teu equip</h3>
          <EquipComponent class="team-item" v-for="(team, index) in teams" :key="index" :team="team" @selected-team="handleSelectedTeam"></EquipComponent>
        </section>
        <section>
          <h3>Subscripcio</h3>
        </section>
        <section>
          <h3>Reserves</h3>
        </section>
        <button>Eliminar compte</button>
      </div>
    </div>
  </template>
  
  <script>
import EquipComponent from './EquipComponent.vue';

  // Habrá que comprobar que el usuario es admin o que su id se corresponde con la id del session storage
  export default {
    name: 'UsuariComponent',
    data() {
      return {
        user: null // Inicializa el usuario como null
      };
    },
    methods:{
        handleSelectedTeam(){
            console.log("Se administran cosas");
        }
    },
    mounted() {
      // Aquí podrías agregar lógica para obtener los datos del usuario,
      // por ejemplo, desde una API o desde sessionStorage
      const userData = JSON.parse(sessionStorage.getItem('userData'));
      if (userData) {
        this.user = userData;
      }
    }
  };
  </script>
  
  <style scoped>
  #user-manager-page{
    padding: 0em 2em;
  }

  .user-manager-container {
    background-color: #eff9f6;
    margin: 0% 5%;
    padding: 0.5em 0.75em;
    border-radius: 1em;
    color: black;
  }

  .user-manager-container h3{
     font-size: 1.25em;   
  }
  </style>
  