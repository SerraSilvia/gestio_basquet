<template>
  <h2>Canvia les dades</h2>
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

    <label for="location">Club</label>
    <select name="location" id="location" v-model="modUser.location">
      <option value="Barcelona">Barcelona</option>
      <option value="Terrassa">Terrassa</option>
      <option value="Sabadell">Sabadell</option>
    </select>
    <small v-if="errors.location" class="form-error">{{
      errors.location
    }}</small>

    <label for="category">Categoria</label>
    <select name="category" id="category" v-model="modUser.category">
      <option value="cadet">Cadet</option>
      <option value="junior">Junior</option>
      <option value="senior">Senior</option>
    </select>
    <small v-if="errors.category" class="form-error">{{
      errors.category
    }}</small>

    <label for="mail">Email</label>
    <input type="email" id="mail" name="mail" v-model="modUser.email" />
    <small v-if="errors.email" class="form-error">{{ errors.email }}</small>

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

      if (!Validators.required(this.modUser.location)) {
        this.errors.location = "La ubicación es obligatoria.";
        return;
      }

      if (!Validators.required(this.modUser.category)) {
        this.errors.category = "La categoría es obligatoria.";
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
      this.$axios.put('people/' + this.modUser)
        .then(response => {
          console.log("response: "+response.data);
        })
        .catch(error => {
          console.error('Error al intentar obtener las reservas', error);
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
      this.modUser.id=this.id;
      this.modUser.name=this.user.name;
      this.modUser.surnames=this.user.surnames;
      this.modUser.email=this.user.email;
      this.modUser.password=this.user.password;
      this.modUser.birthdate=this.user.birthdate;
      this.modUser.user_type=this.user.user_type;
      this.modUser.player_level=this.user.player_level;
      this.modUser.team_id=this.user.team_id;

    } else {
      this.$router.push({ path: '/' });
    }

  }
};
</script>

<style scoped></style>
