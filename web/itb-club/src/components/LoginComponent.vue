<template>
  <section>
    <h2>Iniciar Sessión</h2>
    <div class="title-poligon"></div>
    <form id="form" @submit.prevent="validatorForm">
      <label for="email">Email</label>
      <input type="email" id="email" name="email" v-model="user.email" />
      <small v-if="errors.email" class="form-error">{{ errors.email }}</small>

      <label for="password">Contrasenya</label>
      <input
        type="password"
        id="password"
        name="password"
        v-model="user.password"
      />
      <small v-if="errors.password" class="form-error">{{
        errors.password
      }}</small>

      <input class="button" type="submit" />
    </form>
  </section>
  <RouterLink to="/register">Registrar-se</RouterLink>
</template>

<script>

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
    doLogin() {
      console.log("Iniciando sesion...");
      this.$axios.post('auth/login/', this.user)
        .then(response => {
          console.log('Producto obtenido:', response.data);
          this.logedUser = response.data;
          this.clearForm();
          this.saveSession();
        })
        .catch(error => {
          console.error('Error al intentar hacer el login', error);
        });
    },
    clearForm() {
      this.user = {
        email: "",
        password: "",
      };
    },
    async doLogin() {
      console.log("Iniciando sesión...");
      try {
        const response = await axios.put(
          "http://localhost/gestio_basquet/api/routes/auth/login",
          this.user
        );
        console.log("Usuario autenticado:", response.data);
        this.logedUser = response.data;
        this.clearForm();
        this.saveSession();
      } catch (error) {
        console.error("Error al intentar hacer el login", error);
        this.errorMessage = "Error al iniciar sesión";
      }
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

<style scoped>
</style>
