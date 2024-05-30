<template>
  <section>
    <h2>Crea el teu equip</h2>
    <div id="crear-poligon"></div>
    <p class="info">
      En crear un equip seràs el capità i podras administrar el jugadors que
      s'uneixin al teu equip.
    </p>
    <form id="form" @submit.prevent="validatorForm">
      <label for="name">Nom d'equip</label>
      <input type="text" id="name" name="name" v-model="newTeam.name" />
      <small v-if="errors.name" class="form-error">{{ errors.name }}</small>

      <label for="location">Club</label>
      <select name="location" id="location" v-model="newTeam.location_id">
        <option value="1">Barcelona</option>
        <option value="2">Terrassa</option>
        <option value="3">Sabadell</option>
      </select>
      <small v-if="errors.location" class="form-error">{{ errors.location }}</small>

      <label for="category">Categoria</label>
      <select name="category" id="category" v-model="newTeam.category">
        <option value="cadet">Cadet</option>
        <option value="junior">Junior</option>
        <option value="senior">Senior</option>
      </select>
      <small v-if="errors.category" class="form-error">{{ errors.category }}</small>

      <label for="team_image">Imatge de l'equip</label>
      <select name="team_image" id="team_image" v-model="newTeam.img">
        <option v-for="n in 10" :key="'team' + n" :value="'team' + n + '.png'">
          Team {{ n }}
        </option>
      </select>

      <input class="button" type="submit" />
    </form>
    <p v-if="message" :class="messageClass">{{ message }}</p>
  </section>
</template>

<script>
import axios from 'axios';
import { Validators } from '@/utils/validators';

export default {
  name: "CrearEquipComponent",
  data() {
    return {
      errors: {},
      newTeam: {
        name: "",
        location_id: 1,
        category: "",
        img: "team1.png",
        captain: 0,
      },
      message: null,
      messageClass: null, 
      user:[]
    };
  },
  mounted() {
    this.setCaptainId();
  },
  methods: {
    validatorForm() {
      this.resetForm();

      if (!Validators.required(this.newTeam.name)) {
        this.errors.name = "El nombre es obligatorio.";
        return;
      }
      if (!Validators.required(this.newTeam.location_id)) {
        this.errors.location = "La ubicación es obligatoria.";
        return;
      }
      if (!Validators.required(this.newTeam.category)) {
        this.errors.category = "La categoría es obligatoria.";
        return;
      }

      this.addTeam();
    },
    resetForm() {
      this.errors = {};
    },
    setCaptainId() {
      const user = JSON.parse(sessionStorage.getItem("userData"));
      if (user) {
        this.newTeam.captain = user.id;
      } else {
        console.error('No user ID found in session storage');
      }
    },
    async addTeam() {
      try {
        const response = await axios.post('http://apiitbclub-env.eba-jkyv4asm.us-east-1.elasticbeanstalk.com/teams/', this.newTeam);
        const createdTeamId = response.data.id;
        console.log('Equipo ha sido agregado:', response.data);
        this.updateUserTypeAndTeamId(createdTeamId);
      } catch (error) {
        console.error("Error al agregar el equipo:", error.response ? error.response.data : error.message);
        this.message = 'Error al agregar el equipo: ' + (error.response ? error.response.data.message : error.message);
        this.messageClass = 'error-message';
      }
    },
    async updateUserTypeAndTeamId(teamId) {
      const user = JSON.parse(sessionStorage.getItem("userData"));
      if (user) {
        try {
          const updatedUser = { user_type: 'captain', team_id: teamId };
          const response = await axios.put(`http://apiitbclub-env.eba-jkyv4asm.us-east-1.elasticbeanstalk.com/people/?id=${user.id}`, updatedUser);
          console.log('Usuario actualizado:', response.data);
          user.user_type = 'captain';
          user.team_id = teamId;
          sessionStorage.setItem('userData', JSON.stringify(user));
          this.$router.push('/equips');
        } catch (error) {
          console.error('Error al actualizar el usuario:', error.response ? error.response.data : error.message);
          this.message = 'Error al actualizar el usuario: ' + (error.response ? error.response.data.message : error.message);
          this.messageClass = 'error-message';
        }
      } else {
        console.error('No user ID found in session storage');
      }
    }
  }, 
  mounted() {
    const userData = JSON.parse(sessionStorage.getItem('userData'));
    if (userData) {
        this.user = userData;
    }else{
      this.$router.push({ path: '/login' });
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
input[type="email"],
input[type="password"],
select {
  margin-top: 5px;
  padding: 10px;
  border: 1px solid #00a1e9;
  border-radius: 5px;
  font-size: 16px;
}

input[type="text"]:focus,
input[type="email"]:focus,
input[type="password"]:focus,
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

label {
  margin-top: 3em;
}

.dropdown-info {
  text-align: center;
  margin-bottom: 10px;
  color: #666;
  font-size: 14px;
}

#crear-poligon {
  width: 40em;
  height: 9em;
  transform: skew(20deg);
  background: linear-gradient(
    to right,
    rgb(54, 208, 255),
    rgba(255, 159, 147, 0)
  );
  margin: 1em;
  position: absolute;
  top: 5em;
  left: 7em;
  z-index: -1;
}

.success-message {
  color: green;
  font-weight: bold;
  margin-top: 20px;
}

.error-message {
  color: red;
  font-weight: bold;
  margin-top: 20px;
}
</style>
