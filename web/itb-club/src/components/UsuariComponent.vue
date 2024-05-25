<template>
    <div id="user-manager-page">
      <h2>Hola {{ user ? user.name : 'Usuari' }}</h2>
      <div class="user-manager-container">
        <section>
          <h3>Les teves dades</h3>
          <button class="button">Modificar</button>
        </section>
        <section>
          <h3>El teu equip</h3>
          <EquipComponent class="team-item" @selected-team="handleSelectedTeam" :team="team"></EquipComponent>
        </section>
        <section>
          <h3>Subscripcio</h3>
        </section>
        <section>
          <h3>Reserves</h3>
          <ReservaItemComponent></ReservaItemComponent>
        </section>
        <button class="button">Eliminar compte</button>
      </div>
    </div>
  </template>
  
  <script>
import EquipComponent from './EquipComponent.vue';
import ReservaItemComponent from './ReservaItemComponent.vue';


  // Habrá que comprobar que el usuario es admin o que su id se corresponde con la id del session storage
  export default {
    name: 'UsuariComponent',
    data() {
      return {
        user: null,
        team: {
          
        }, 
      };
    },
    components:{
      EquipComponent,
      ReservaItemComponent
    },
    methods:{
        handleSelectedTeam(){
            console.log("Se administran cosas");
        },
        getReservas(){
          console.log("Se consiguen reservas");
        }
    },
    mounted() {
      const userData = JSON.parse(sessionStorage.getItem('userData'));
      if (userData) {
        this.user = userData;
      }
      this.getReservas();
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
  