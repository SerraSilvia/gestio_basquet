<template>
  <section>
    <h2>Iniciar Sessión</h2>
    <div class="title-poligon"></div>
    <form id="form" @submit.prevent="validatorForm">
      <label for="email">Email</label>
      <input type="email" id="email" name="email" v-model="user.email" />
      <small v-if="errors.email" class="form-error">{{ errors.email }}</small>

      <label for="password">Contrasenya</label>
      <input type="password" id="password" name="password" v-model="user.password" />
      <small v-if="errors.password" class="form-error">{{ errors.password }}</small>

      <input class="button" type="submit" />
    </form>
  </section>
  <RouterLink to="/register">Registrar-se</RouterLink>
</template>

<script>
import { Validators } from "@/utils/validators.js";
export default {
  name: "LoginComponent",
  data() {
    return {
      errors: {},
      user: {
        email: "",
        password: "",
      },
      logedUser: null,
    };
  },
  methods: {
    validatorForm() {

      if (!Validators.required(this.user.email)) {
        this.errors.email = "El correo electrónico es obligatorio.";
        return;
      } else if (!Validators.email(this.user.email)) {
        this.errors.email = "El correo electrónico debe ser válido.";
        return;
      }

      if (!Validators.required(this.user.password)) {
        this.errors.password = "La contraseña es obligatoria.";
        return;
      }

      this.doLogin();
    },
    doLogin() {
      console.log("Iniciando sesion...");
      this.$axios.get('people/?email=' + this.user.email)
        .then(response => {
          console.log(response.data[0]);
          this.user = response.data[0];
          this.saveSession();
          this.clearForm();
          //aqui redirigira a la pagina de usuario
        })
        .catch(error => {
          console.error('Error al intentar obtener el usuario', error);
        });
    },
    clearForm() {
      this.user = {
        email: "",
        password: "",
      };
    },
    saveSession() {
      console.log("Guardando la sesión en sessionStorage");
      const userData = {
        name: this.logedUser.name,
        level: this.logedUser.level,
        id: this.logedUser.id,
        location_id: this.logedUser.location_id,
      };
      sessionStorage.setItem("userData", JSON.stringify(userData));
    },
  },
};
</script>

<style scoped></style>
