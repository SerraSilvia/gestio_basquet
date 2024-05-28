<template>
  <section id="register">
    <h2>Registrar-se</h2>
    <div id="crear-poligon"></div>
    <form id="form" @submit.prevent="validatorForm">
      <label for="name">Nom</label>
      <input type="text" id="name" name="name" v-model="newUser.name" />
      <small v-if="errors.name" class="form-error">{{ errors.name }}</small>

      <label for="surnames">Surnames</label>
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
  <RouterLink to="/login">Logar-se</RouterLink>
</template>
<script>
import { Validators } from "@/utils/validators.js";

export default {
  name: "RegisterComponent",
  data() {
    return {
      errors: {},
      newUser: {
        name: "",
        surnames: "",
        dni: "",
        location: null,
        player_level: null,
        email: "",
        password: "",
        user_type:"player",
      },
    };
  },
  methods: {
    validatorForm() {
      this.resetForm();

      if (!Validators.required(this.newUser.name)) {
        this.errors.name = "El nombre es obligatorio.";
        return;
      }

      if (!Validators.required(this.newUser.surnames)) {
        this.errors.surnames = "Los apellidos son obligatorios.";
        return;
      }

      if (!Validators.required(this.newUser.dni)) {
        this.errors.dni = "El DNI es obligatorio.";
        return;
      }

      if (!Validators.required(this.newUser.location)) {
        this.errors.location = "La ubicación es obligatoria.";
        return;
      }

      if (!Validators.required(this.newUser.player_level)) {
        this.errors.category = "La categoría es obligatoria.";
        return;
      }

      if (!Validators.required(this.newUser.email)) {
        this.errors.email = "El correo electrónico es obligatorio.";
        return;
      } else if (!Validators.email(this.newUser.email)) {
        this.errors.email = "El correo electrónico debe ser válido.";
        return;
      }

      if (!Validators.required(this.newUser.password)) {
        this.errors.password = "La contraseña es obligatoria.";
        return;
      }

      this.addUser();
    },
    resetForm() {
      this.errors = {
        name: null,
        surnames: null,
        dni: null,
        location: null,
        category: null,
        email: null,
        password: null,
        birthdate: "",
        user_type: "",
        player_level: "",
        team_id: null,
      };
    },
    addUser() {
      console.log("Creando un nuevo usuario...");

      this.$axios.post("auth/register/", this.newUser)
        .then((response) => {
          if (response.data.status != "error") {
            this.saveSession(response.data.user);
            this.$router.push({ path: '/usuari' });
          } else {
            console.error("Error en la creación del usuario:", response.data.message);
          }

          this.saveSession();
        })

        .catch((error) => {
          console.error("Error al agregar el usuario:", error);
        });
      this.resetForm();

    },
    saveSession() {
      const userData = {
        id: this.newUser.id,
        name: this.newUser.name,
        surnames: this.newUser.surnames,
        user_type: this.newUser.user_type,
        player_level: this.newUser.player_level,
        mail: this.newUser.email,
        team_id: this.newUser.team_id,
        birthday: this.newUser.birthday,
      };
      sessionStorage.setItem("userData", JSON.stringify(userData));
      console.log("Contenido de sessionStorage después de guardar:", sessionStorage.getItem("userData"));
      this.$router.push({ path: '/usuari' });

    }
  },
};
</script>

<style>
.form-error {
  color: red;
}
</style>
