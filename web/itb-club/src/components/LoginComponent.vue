<template>
  <section v-if="!loged" id="login">
    <h2>Iniciar Sessió</h2>
    <div class="title-poligon"></div>
    <form class="form" @submit.prevent="validatorForm">
      <label for="email">Email</label>
      <input type="email" id="email" name="email" v-model="user.email" />
      <small v-if="errors.email" class="form-error">{{ errors.email }}</small>

      <label for="password">Contrasenya</label>
      <input type="password" id="password" name="password" v-model="user.password" />
      <small v-if="errors.password" class="form-error">{{ errors.password }}</small>

      <input class="button" type="submit" />
      <div>
        No tens compte?
        <RouterLink to="/register" class="link">Registrar-se</RouterLink>
      </div>
    </form>
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
      loged: false,
    };
  },
  methods: {
    validatorForm() {

      if (!Validators.required(this.user.email)) {
        this.errors.email = "El correo electronic es obligatori.";
        return;
      } else if (!Validators.email(this.user.email)) {
        this.errors.email = "El correo electronic ha de ser valid.";
        return;
      }

      if (!Validators.required(this.user.password)) {
        this.errors.password = "La contraseña es obligatoria.";
        return;
      }

      this.doLogin();
    },
    doLogin() {
      this.$axios.post('auth/login/', this.user)
        .then(response => {
          console.log(response);
          if (response.data.id != undefined) {
            console.log("Usuari logat:", response.data);
            this.logedUser = response.data;
            this.saveSession();
            this.clearForm();
          }

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
        user_type: this.logedUser.user_type,
        player_level: this.logedUser.player_level,
        mail: this.logedUser.email,
        team_id: this.logedUser.team_id,
        birthday: this.logedUser.birthday,
        profile_img: this.logedUser.profile_img
      };
      sessionStorage.setItem("userData", JSON.stringify(userData));
      console.log("SessionStorage", sessionStorage.getItem("userData"));
      this.$router.push({ path: '/usuari' });

    },
    checkSession() {
      if (sessionStorage.getItem("userData") != null) this.loged = true;
    },
    logOut() {
      sessionStorage.removeItem("userData");
      this.$router.push({ path: '/' });
    }
  },
  mounted() {
    this.checkSession();
  }
};
</script>

<style scoped>
#login {
  padding-left: 1.5rem;
  padding-right: 1.5rem;
}
</style>
