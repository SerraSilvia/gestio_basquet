<template>
  <section>
    <h2>Crea el teu equip</h2>
    <div id="crear-poligon"></div>
    <p class="info">En crear un equip seràs el capità i podras administrar els jugadors que s'uneixin al teu equip.</p>
    <form @submit.prevent="addTeam">
      <label for="name">Nom d'equip</label>
      <input type="text" id="name" name="name" v-model="newTeam.name" required>

      <label for="location_id">Club</label>
      <select name="location_id" id="location_id" v-model="newTeam.location_id" required>
        <option value="1">Barcelona</option>
        <option value="2">Terrassa</option>
        <option value="3">Sabadell</option>
      </select>

      <label for="category">Categoria</label>
      <select name="category" id="category" v-model="newTeam.category" required>
        <option value="cadet">Cadet</option>
        <option value="junior">Junior</option>
        <option value="senior">Senior</option>
      </select>
      <input class="button" type="submit" value="Crear">
    </form>
  </section>
</template>

<script>
import axios from '../axios.js';

export default {
  name: 'CrearEquipComponent',
  data() {
    return {
      newTeam: {
        name: '',
        location_id: 1,
        category: '',
        total_score: 0,
        img: '',
        captain: 0,
        player1: 0,
        player2: 0,
        player3: 0,
        player4: 0
      }
    };
  },
  mounted() {
    this.setCaptainId();
  },
  methods: {
    setCaptainId() {
      this.newTeam.captain = 280;//HARDCODEADO
      /*const userId = parseInt(sessionStorage.getItem('userId'), 10);
      if (userId) {
        this.newTeam.captain = userId;
        this.newTeam.captain = 280;
      } else {
        console.error('No user ID found in session storage');
      }*/
    },
    addTeam() {
      console.log("Creando un nuevo equipo...");
      axios.post('http://localhost/gestio_basquet/api/routes/teams/', this.newTeam)
        .then(response => {
          console.log('Equipo ha sido agregado:', response.data);
          this.clearForm();
        })
        .catch(error => {
          console.error('Error al agregar el equipo:', error);
        });
    },
    clearForm() {
      this.newTeam = {
        name: '',
        location_id: 1,
        category: '',
        total_score: 0,
        img: '',
        captain: parseInt(sessionStorage.getItem('userId'), 10),
        player1: 0,
        player2: 0,
        player3: 0,
        player4: 0
      };
    }
  }
};
</script>

<style scoped>
section {
  padding-top: 1em;
}

form {
  max-width: 90%;
  margin: 5em 2em;
  padding: 2em;
  background-color: #eff9f6;
  border-radius: 10px;
  display: flex;
  flex-direction: column;
}

label {
  margin-top: 1em;
  font-weight: bold;
}

input[type="text"],
select {
  margin-top: 5px;
  padding: 10px;
  border: 1px solid #00a1e9;
  border-radius: 5px;
  font-size: 16px;
}

input[type="text"]:focus,
select:focus {
  border-color: #00a1e9;
  outline: none;
}

input[type="submit"] {
  width: 6em;
  margin: auto;
  border-color: white;
  border-style: solid;
}

.info {
  padding-left: 3em;
}

#crear-poligon {
  width: 40em;
  height: 9em;
  transform: skew(20deg);
  background: linear-gradient(to right, rgb(54, 208, 255), rgba(255, 159, 147, 0));
  margin: 1em;
  position: absolute;
  top: 5em;
  left: 7em;
  z-index: -1;
}
</style>
