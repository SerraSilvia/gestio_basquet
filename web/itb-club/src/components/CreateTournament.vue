<template>
   
   <section id="create-tournament">
      <h2>Crear torneig</h2>
      <div id="crear-poligon"></div>
      <form id="form" @submit.prevent="validatorForm">
        <label for="name">Nom</label>
        <input type="text" id="name" name="name" v-model="newUser.name" />
        <small v-if="errors.name" class="form-error">{{ errors.name }}</small>
  
        <label for="surnames">Cognoms</label>
        <input type="text" id="surnames" name="surnames" v-model="newUser.surnames" />
        <small v-if="errors.surnames" class="form-error">{{
          errors.surnames
        }}</small>
  
        <label for="dni">DNI</label>
        <input type="text" id="dni" name="dni" v-model="newUser.dni" />
        <small v-if="errors.dni" class="form-error">{{ errors.dni }}</small>
  
        <label for="birthdate">Data de naixement</label>
        <input type="datetime-local" id="birthdate" name="birthdate" v-model="newUser.birthdate" required />
  
        <label for="location">Club</label>
        <select name="location" id="location" v-model="newUser.location">
          <option value="Barcelona">Barcelona</option>
          <option value="Terrassa">Terrassa</option>
          <option value="Sabadell">Sabadell</option>
        </select>
        
        <small v-if="errors.location" class="form-error">{{
          errors.location
        }}</small>
  
        <label for="category">Categoria</label>
        <select name="category" id="category" v-model="newUser.player_level">
          <option value="cadet">Cadet</option>
          <option value="junior">Junior</option>
          <option value="senior">Senior</option>
        </select>

        <small v-if="errors.category" class="form-error">{{
          errors.category
        }}</small>

        <label for="user_type">Nivell d'usuari</label>
        <select name="user_type" id="user_type" v-model="newUser.user_type">
          <option value="admin">Admin</option>
          <option value="employee">Employee</option>
          <option value="professor">Professor</option>
          <option value="player">Player</option>
          <option value="captain">Captain</option>

        </select>
        
        <small v-if="errors.user_type" class="form-error">{{
          errors.user_type
        }}</small>
  
        <label for="mail">Email</label>
        <input type="email" id="mail" name="mail" v-model="newUser.email" />
        <small v-if="errors.email" class="form-error">{{ errors.email }}</small>
  
        <label for="password">Contrasenya</label>
        <input type="password" id="password" name="password" v-model="newUser.password" />
        <small v-if="errors.password" class="form-error">{{
          errors.password
        }}</small>
  
        <input class="button" type="submit" />
      </form>
    </section>
  
</template>
  
  <script>
    export default {
    name: 'CreateTournament',
    data() {
      return {
        newTournament:{}
      };
    },
    methods: {
        createTournament(){
            console.log("Se intenta crear un torneo");
        }
    },
    mounted() {
      const userData = JSON.parse(sessionStorage.getItem('userData'));
      if (userData) {
        this.user = userData;
        if (this.user.user_type="player"||this.user.user_type="captain") {
            console.log("usuario no autorizado");
            this.$router.push({ path: '/' });

        }
      } else {
        this.$router.push({ path: '/login' });
      }
    }
  };
  </script>
  
  <style scoped>
  #user-manager-page {
    padding: 0em 2em;
  }
  
  .user-manager-container {
    background-color: #eff9f6;
    margin: 5% 5%;
    padding: 1.25em 2em;
    border-radius: 1em;
    color: black;
  }
  
  .user-manager-container h3 {
    font-size: 1.25em;
    margin-bottom: 0.5em;
  }
  
  .user-manager-container section {
    margin: 1em 0em;
  }
  
  .flex {
    display: flex;
  }
  
  .center-container {
    padding: 0.5em 0em;
    display: flex;
    flex-direction: row;
    justify-content: space-around;
    align-items: center;
  }
  
  #user-info .white {
    padding: 0.5em;
    background-color: white;
    border-radius: 0.5em;
    margin-bottom: 1em;
  }
  
  #user-info p {
    padding: 0.5em;
  }
  </style>
  