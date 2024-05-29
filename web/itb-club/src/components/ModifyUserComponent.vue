<template>
  <h2>Canvia les dades</h2>
  <div id="crear-poligon"></div>
  <form class="form" @submit.prevent="validatorForm">
    <label for="name">Nom</label>
    <input type="text" id="name" name="name" v-model="modUser.name" />
    <small v-if="errors.name" class="form-error">{{ errors.name }}</small>

    <label for="name">Surnames</label>
    <input type="text" id="surnames" name="surnames" v-model="modUser.surnames" />
    <small v-if="errors.surnames" class="form-error">{{
      errors.surnames
    }}</small>

    <label for="birthdate">Data de naixement</label>
    <input type="datetime-local" id="birthdate" name="birthdate" v-model="modUser.birthdate" required />

    <label for="teams">Equip</label>
    <select name="teams" id="teams" v-model="modUser.team_id">
      <option v-for="team in teams" :key="team.id" :value="team.id">
        {{ team.name }}
      </option>
    </select>
    <small v-if="errors.team_id" class="form-error">{{
      errors.team_id
    }}</small>

    <label for="category">Categoria</label>
    <select name="category" id="category" v-model="modUser.player_level">
      <option value="youth">Cadet</option>
      <option value="junior">Junior</option>
      <option value="semi-professional">Semi-Professional</option>
      <option value="professional">Professional</option>
    </select>
    <small v-if="errors.category" class="form-error">{{
      errors.category
    }}</small>

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
    <small v-if="errors.password" class="form-error">{{
      errors.password
    }}</small>

    <div v-if="user.user_type == 'admin'">

    </div>

    <input class="button" type="submit" />
  </form>
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
      user: [],
      errors: {},
      modUser: {
        id:0,
        name: "", 
        surnames: "", 
        password: "", 
        birthdate: "", 
        user_type: "player", 
        player_level: "", 
        team_id: null,
        profile_img: null
      },
    }
  },
  methods: {
    validatorForm() {
      if (!Validators.required(this.modUser.name)) {
        this.errors.name = "El nombre es obligatorio.";
        return;
      }

      if (!Validators.required(this.modUser.surnames)) {
        this.errors.surnames = "Los apellidos son obligatorios.";
        return;
      }

      if (!Validators.required(this.modUser.team_id)) {
        this.errors.team_id = "La ubicación es obligatoria.";
        return;
      }

      if (!Validators.required(this.modUser.player_level)) {
        this.errors.player_level = "La categoría es obligatoria.";
        return;
      }

      if (!Validators.required(this.modUser.email)) {
        this.errors.email = "El correo electrónico es obligatorio.";
        return;

      } else if (!Validators.email(this.modUser.email)) {
        this.errors.email = "El correo electrónico debe ser válido.";
        return;
      }

      if (!Validators.required(this.modUser.password)) {
        this.errors.password = "La contraseña es obligatoria.";
        return;
      }

      this.modifyUser();
    },
    modifyUser() {
      console.log("Se intenta modificar el usuario");
      this.$axios.put('people/?id=' + this.modUser.id, this.modUser)
        .then(response => {
          console.log("response: "+response.data);
          /* Aqui llamarias a una funcion para mostrar un snackbar/toast  con el mensaje de la API */
          /* https://www.w3schools.com/howto/howto_js_snackbar.asp */
        })
        .catch(error => {
          console.error('Error al intentar obtener las reservas', error);
        });
    }, 
    getOldData(){
     
      this.$axios.get('people/?id=' + this.id)
        .then(response => {
          console.log("old data: ", response.data[0]);
          this.oldUser = response.data[0];
          this.modUser = this.oldUser;

          this.modUser.password = "";
        })
        .catch(error => {
          console.error('Error al intentar obtener el usuario', error);
        });

    },
    getTeams() {
      this.$axios.get(`teams/`)
          .then(response => {
            this.teams = response.data;
            console.log(this.teams);
          })
          .catch(error => {
            console.error('Error al intentar obtener los equipos', error);
          });
    }
  },
  mounted() {
    const userData = JSON.parse(sessionStorage.getItem('userData'));
    if (userData) {
      this.user = userData;
      if (this.user.id !== this.id && this.user.user_type === 'player') {
        console.log("no cumple las condiciones");
        this.$router.push({ path: '/' });
      }
      this.getTeams();
      this.getOldData();
    } else {
      this.$router.push({ path: '/' });
    }

  }
};
</script>

<style scoped></style>
