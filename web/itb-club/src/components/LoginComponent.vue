<template>
  <section v-if="!loged">
    <h2>Iniciar Sessió</h2>
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
    <RouterLink to="/register">Registrar-se</RouterLink>
  </section>
  <section v-else="loged">
    <h2>Tancar la sessió</h2>
    <button class="button" @click="logOut">Logout</button>
  </section>
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
      loged:false,
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
          this.logedUser = response.data[0];
          this.saveSession();
          this.clearForm();
        })
        .catch(error => {
          console.error('Error al intentar obtener el usuario', error);
        });
    },
    clearForm() {
      this.user = {
        email: "",
        password: "",
      }
    },
    saveSession() {
      const userData = {
        id: this.logedUser.id,
        name: this.logedUser.name,
        surnames: this.logedUser.surnames,
        level: this.logedUser.user_type,
        player_level: this.logedUser.player_level,
        mail: this.logedUser.email,
        team_id: this.logedUser.team_id,
        birthday: this.logedUser.birthday,
      };
      sessionStorage.setItem("userData", JSON.stringify(userData));
      console.log("Contenido de sessionStorage después de guardar:", sessionStorage.getItem("userData"));
      this.$router.push({ path: '/usuari' });

    },
    checkSession(){
      if(sessionStorage.getItem("userData")!=null) this.loged=true;
    }, 
    logOut(){
      sessionStorage.removeItem("userData");
      this.$router.push({ path: '/' });
    }
  },
  mounted() {
    this.checkSession();
  }
};
</script>

<style scoped></style>
