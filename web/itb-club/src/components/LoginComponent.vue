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
export default {
    name:'LoginComponent',
    data() {
      return {
        user: {//TODO:hace falta cambiar los datos
          name: '',
          surnames: '',
          dni: 0,
          email: '',
          password: '',
          birthdate: '',
          user_type: '',
          player_level: '',
          team_id: null,
        }
      };
    },
    methods: {
      dologin() {
        console.log("Iniciando sesion...");
        
      },
      clearForm() {//hace falta cambiar los datos
        this.user = {
          name: '',
          surnames: '',
          dni: 0,
          email: '',
          password: '',
          birthdate: '',
          user_type: '',
          player_level: '',
          team_id: null,
        };
      }
    }
  
};
</script>