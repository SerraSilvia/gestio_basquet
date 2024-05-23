<template>
  <section>
    <h2>Log in</h2>
    <div id="crear-poligon"></div>
    <form @submit.prevent="doLogin">
      <label for="mail">Mail</label>
      <input type="email" id="mail" v-model="user.email" name="mail" required>

      <label for="password">Contrasenya</label>
      <input type="password" id="password" v-model="user.password" name="password" required>

      <input class="button" type="submit" value="Login">
    </form>
    <RouterLink to="/register">Registrar-se</RouterLink>
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
    };
  },
  methods: {
    doLogin() {
      console.log("Iniciando sesion...");
      axios.post('auth/login', this.user)
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
        email: '',
        password: ''
      };
    },
    saveSession() {
      console.log('Guardando la sesion en sessionStorage');
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
