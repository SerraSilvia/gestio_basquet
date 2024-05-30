<template>
    <h2>Canvia les dades del torneig</h2>
    <form class="form" @submit.prevent="validatorForm">
      <label for="name">Nom</label>
      <input type="text" id="name" name="name" v-model="modTournament.name" />
      <small v-if="errors.name" class="form-error">{{ errors.name }}</small>
  
      <label for="location">Club</label>
      <select name="location" id="location" v-model="modTournament.location_id">
        <option value="1">Barcelona</option>
        <option value="2">Terrassa</option>
        <option value="3">Sabadell</option>
      </select>
      <small v-if="errors.location" class="form-error">{{ errors.location }}</small>
  
      <label for="date_start">Data d'inici</label>
      <input type="datetime-local" id="date_start" name="date_start" v-model="modTournament.date_start" required />
  
      <label for="date_end">Data de fi</label>
      <input type="datetime-local" id="date_end" name="date_end" v-model="modTournament.date_end" required />
  
      <input class="button" type="submit" value="Actualitzar Torneig" />
    </form>
  </template>
  
  <script>
  import { Validators } from '../../utils/validators';
  
  export default {
    name: 'ModifyTournaments',
    props: {
      id: {
        type: String,
        required: true
      }
    },
    data() {
      return {
        user: [],
        errors: {},
        modTournament: {
          id: 0,
          location_id: null,
          name: "",
          date_start: "",
          date_end: "",
          created_at: new Date().toISOString(),
          updated_at: new Date().toISOString(),
          deleted_at: null
        }
      };
    },
    methods: {
      validatorForm() {
        this.errors = {};
  
        if (!Validators.required(this.modTournament.name)) {
          this.errors.name = "El nombre es obligatorio.";
        }
  
        if (!Validators.required(this.modTournament.location_id)) {
          this.errors.location = "La ubicación es obligatoria.";
        }
  
        if (!this.errors.name && !this.errors.location) {
          this.modifyTournament();
        }
      },
      modifyTournament() {
        console.log("Se intenta modificar el torneo");
        this.modTournament.updated_at = new Date().toISOString();
        this.$axios.put('tournaments/?id=' + this.id, this.modTournament)
          .then(response => {
            console.log("response: " + response.data);
            this.$router.push({ path: `/tornejos/${this.id}` });
          })
          .catch(error => {
            console.error('Error al intentar modificar el torneo', error);
          });
      },
      getOldData() {
        this.$axios.get('tournaments/' + this.id)
          .then(response => {
            console.log("old data: " + response.data);
            this.modTournament = response.data;
          })
          .catch(error => {
            console.error('Error al intentar obtener el torneo', error);
          });
      }
    },
    mounted() {
      const userData = JSON.parse(sessionStorage.getItem('userData'));
      if (userData) {
        this.user = userData;
        if (this.user.user_type === 'player' || this.user.user_type === 'captain') {
          console.log("usuario no autorizado");
          this.$router.push({ path: '/' });
        }
        this.getOldData();
      } else {
        this.$router.push({ path: '/login' });
      }
    }
  };
  </script>
  
  <style scoped>
  /* Estilos para el formulario */
  .form {
    padding: 1em;
    background-color: #f9f9f9;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  }
  
  .form label {
    display: block;
    margin-bottom: 0.5em;
  }
  
  .form input, .form select {
    width: 100%;
    padding: 0.5em;
    margin-bottom: 1em;
    border: 1px solid #ccc;
    border-radius: 5px;
  }
  
  .form .form-error {
    color: red;
    font-size: 0.875em;
    margin-top: -0.5em;
    margin-bottom: 1em;
  }
  
  .form .button {
    padding: 0.75em 1.5em;
    background-color: #28a745;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
  }
  
  .form .button:hover {
    background-color: #218838;
  }
  </style>