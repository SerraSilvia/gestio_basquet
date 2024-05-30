<template>
  <div>
    <h2>Canvia les dades</h2>
    <div id="crear-poligon"></div>
    <form class="form" @submit.prevent="validatorForm">
      <label for="name">Nom</label>
      <input type="text" id="name" name="name" v-model="modUser.name" />
      <small v-if="errors.name" class="form-error">{{ errors.name }}</small>

      <label for="surnames">Surnames</label>
      <input type="text" id="surnames" name="surnames" v-model="modUser.surnames" />
      <small v-if="errors.surnames" class="form-error">{{ errors.surnames }}</small>

      <label for="birthdate">Data de naixement</label>
      <input type="datetime-local" id="birthdate" name="birthdate" v-model="modUser.birthdate" required />

      <label for="teams">Equip</label>
      <select name="teams" id="teams" v-model="modUser.team_id" :disabled="isCaptain">
        <option value="">No tener equipo</option> <!-- Opción para no tener equipo -->
        <option v-for="team in teams" :key="team.id" :value="team.id">
          {{ team.name }}
        </option>
      </select>

      <label for="category">Categoria</label>
      <select name="category" id="category" v-model="modUser.player_level">
        <option value="youth">Cadet</option>
        <option value="junior">Junior</option>
        <option value="semi-professional">Semi-Professional</option>
        <option value="professional">Professional</option>
      </select>
      <small v-if="errors.category" class="form-error">{{ errors.category }}</small>

      <label for="mail">Email</label>
      <input type="email" id="mail" name="mail" v-model="modUser.email" />
      <small v-if="errors.email" class="form-error">{{ errors.email }}</small>

      <label for="avatar">Avatar</label>
      <select name="avatar" id="avatar" v-model="modUser.profile_img">
        <option value="avatar_default.png">Default</option>
        <option value="avatar1.png">Avatar 1</option>
        <option value="avatar2.png">Avatar 2</option>
        <option value="avatar3.png">Avatar 3</option>
        <option value="avatar4.png">Avatar 4</option>
        <option value="avatar5.png">Avatar 5</option>
        <option value="avatar6.png">Avatar 6</option>
        <option value="avatarAdmin.png">Avatar Admin</option>
      </select>

      <label for="password">Contrasenya</label>
      <input type="password" id="password" name="password" v-model="modUser.password" />
      <small v-if="errors.password" class="form-error">{{ errors.password }}</small>

      <input class="button" type="submit" />
    </form>
  </div>
</template>

<script>
import { Validators } from '@/utils/validators';

export default {
  name: 'ModifyUserComponent',
  props: {
    id: {
      type: String,
      required: true
    }
  },
  data() {
    return {
      teams: [],
      user: null,
      errors: {},
      modUser: {
        id: 0,
        name: "", 
        surnames: "", 
        password: "", 
        birthdate: "", 
        user_type: "player", 
        player_level: "", 
        team_id: null,
        profile_img: null
      },
      isCaptain: false
    }
  },
  methods: {
    validatorForm() {
      this.errors = {};
      if (!Validators.required(this.modUser.name)) {
        this.errors.name = "El nombre es obligatorio.";
      }
      
      if (!Validators.required(this.modUser.surnames)) {
        this.errors.surnames = "Los apellidos son obligatorios.";
      }

      if (!Validators.required(this.modUser.player_level)) {
        this.errors.player_level = "La categoría es obligatoria.";
      }

      if (!Validators.required(this.modUser.email)) {
        this.errors.email = "El correo electrónico es obligatorio.";
      } else if (!Validators.email(this.modUser.email)) {
        this.errors.email = "El correo electrónico debe ser válido.";
      }

      if (!Validators.required(this.modUser.password)) {
        this.errors.password = "La contraseña es obligatoria.";
      }

      if (Object.keys(this.errors).length === 0) {
        this.modifyUser();
      }
    },
    async modifyUser() {
      console.log("Se intenta modificar el usuario", this.user, this.modUser);
  
      if (this.modUser.team_id === "") {
        // El jugador ha seleccionado "No tener equipo"
        try {
          // Llamada a la API para eliminar al jugador del equipo
          const deleteTeamPlayerResponse = await this.$axios.put('http://apiitbclub-env.eba-jkyv4asm.us-east-1.elasticbeanstalk.com/teams/?action=deletePlayer', {
            team_id: this.user.team_id,
            user_id: this.modUser.id
          });
          console.log("Jugador eliminado del equipo: " + deleteTeamPlayerResponse.data);
        } catch (error) {
          console.error('Error al intentar eliminar al jugador del equipo', error);
          if (error.response) {
            console.error("Datos de error del servidor:", error.response.data);
          }
          return;
        }
      }

      try {
        console.log("Datos enviados:", this.modUser);
        const response = await this.$axios.put('http://apiitbclub-env.eba-jkyv4asm.us-east-1.elasticbeanstalk.com/people/?id=' + this.modUser.id, this.modUser);
        console.log("response: " + response.data);
        if (this.modUser.team_id) {
          await this.addPlayerToTeam(this.modUser.team_id, this.modUser.id);
        }
        this.$router.push({ path: '/usuari' });
      } catch (error) {
        console.error('Error al intentar modificar el usuario', error);
        if (error.response) {
          console.error("Datos de error del servidor:", error.response.data);
        }
      }
    },
    async addPlayerToTeam(teamId, userId) {
      try {
        const response = await this.$axios.put('http://apiitbclub-env.eba-jkyv4asm.us-east-1.elasticbeanstalk.com/teams/', null, {
          params: {
            id: teamId,
            user_id: userId
          }
        });
        console.log("Usuario añadido al equipo: " + response.data);
      } catch (error) {
        console.error('Error al intentar añadir el usuario al equipo', error);
      }
    },
    getOldData() {
      this.$axios.get('http://apiitbclub-env.eba-jkyv4asm.us-east-1.elasticbeanstalk.com/people/?id=' + this.id)
        .then(response => {
          console.log("old data: ", response.data[0]);
          this.modUser = response.data[0];
          this.modUser.password = "";

          if (this.user.id !== this.modUser.id) {
            this.user = JSON.parse(JSON.stringify(this.modUser));
          }

          if (this.modUser.team_id) {
            this.checkIfCaptain();
          }
        })
        .catch(error => {
          console.error('Error al intentar obtener el usuario', error);
        });
    },
    getTeams() {
      this.$axios.get('http://apiitbclub-env.eba-jkyv4asm.us-east-1.elasticbeanstalk.com/teams/')
        .then(response => {
          this.teams = response.data;
        })
        .catch(error => {
          console.error('Error al intentar obtener los equipos', error);
        });
    },
    checkIfCaptain() {
      this.$axios.get(`http://apiitbclub-env.eba-jkyv4asm.us-east-1.elasticbeanstalk.com/teams/?id=${this.modUser.team_id}`)
        .then(response => {
          const team = response.data[0];
          if (team.captain === this.modUser.id) {
            this.isCaptain = true;
          }
        })
        .catch(error => {
          console.error('Error al verificar si el usuario es capitán', error);
        });
    }
  },
  mounted() {
    const userData = JSON.parse(sessionStorage.getItem('userData'));
    if (userData) {
      this.user = userData;
      if (this.user.id !== this.id && this.user.user_type === 'player') {
        this.$router.push({ path: '/' });
      } else {
        this.getTeams();
        this.getOldData();
      }
    } else {
      this.$router.push({ path: '/' });
    }
  }
};
</script>

<style scoped>

</style>
