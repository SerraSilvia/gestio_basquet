<template>
  <section>
    <h2>Iniciar Sesión</h2>
    <div id="crear-poligon"></div>
    <form @submit.prevent="doLogin">
      <label for="email">Correo Electrónico:</label>
      <input type="email" id="email" v-model="user.email" name="email" required>

      <label for="password">Contraseña:</label>
      <input type="password" id="password" v-model="user.password" name="password" required>

      <input class="button" type="submit" value="Iniciar Sesión">
    </form>
    <RouterLink to="/register">Registrarse</RouterLink>
    <p v-if="errorMessage" class="error">{{ errorMessage }}</p>
  </section>
</template>

<script>
import axios from 'axios';

export default {
  name: 'LoginComponent',
  data() {
    return {
      user: {
        email: '',
        password: ''
      },
      logedUser: null,
      errorMessage: ''
    };
  },
  methods: {
    async doLogin() {
      console.log("Iniciando sesión...");
      try {
        const response = await axios.post('http://localhost/gestio_basquet/api/routes/auth/login', this.user);
        console.log('Usuario autenticado:', response.data);
        this.logedUser = response.data;
        this.clearForm();
        this.saveSession();
      } catch (error) {
        console.error('Error al intentar hacer el login', error);
        this.errorMessage = 'Error al iniciar sesión';
      }
    },
    clearForm() {
      this.user = {
        email: '',
        password: ''
      };
    },
    saveSession() {
      console.log('Guardando la sesión en sessionStorage');
      const userData = {
        name: this.logedUser.name,
        level: this.logedUser.level,
        id: this.logedUser.id,
        location_id: this.logedUser.location_id
      };
      sessionStorage.setItem('userData', JSON.stringify(userData));
    }
  }
};
</script>

<style scoped>
.error {
  color: red;
}
</style>