<template>
     <section>
        <h2>Log in</h2>
        <div id="crear-poligon"></div>
        <form action="doLogin">

            <label for="mail">Mail</label>
            <input type="email" id="mail" name="mail">

            <label for="password">Contrasenya</label>
            <input type="password" id="password" name="password">

            <input class="button" type="submit">
        </form>
    </section>
    <RouterLink to="/register">Registrar-se</RouterLink>

</template>
<script>
import axios from 'axios';

export default {
    name:'LoginComponent',
    data() {
      return {
        user: {
          email: '',
          password: ''
        },
        logedUser:null,
      };
    },
    methods: {//TODO: hay que probar el funcionamiento
      doLogin() {
        console.log("Iniciando sesion...");
        axios.get('auth/login', this.user)
        .then(response =>{
          console.log('Producto obtenido:', response.data);
          this.logedUser=response.data;
          this.clearForm()
          this.saveSession()
        })
        .catch(error =>{
          console.error('Error al intentar hacer el login');
        })
      },
      clearForm() {
        this.user = {
          email: '',
          password: ''
        };
      },
      saveSession(){//TODO: falta acabar y que corresponda con los datos obtenidos del json
        console.log('guardando la sesion en sessionStorage');
        userData=this.logedUser
        localStorage.setItem('userData', JSON.stringify(userData));//guardar en el local storage
      }
    }
  
};
</script>