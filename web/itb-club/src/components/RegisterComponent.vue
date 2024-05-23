<template>
         <section id="register">
        <h2>Registrar-se</h2>
        <div id="crear-poligon"></div>
        <form action="addUser">
            <label for="name">Nom</label>
            <input type="text" id="name" name="name">

            <label for="name">Surnames</label>
            <input type="text" id="surnames" name="surnamess">

            <label for="name">DNI</label><!--TODO: hacer que valide con js antes de enviar el formulario-->
            <input type="text" id="dni" name="dni">

            <label for="birthdate">Data de naixement</label>
            <input type="datetime-local" id="birthdate" name="birthdate" v-model="newTeam.birthdate" required>


            <label for="location">Club</label>
            <select name="location" id="location">
                <option value="Barcelona">Barcelona</option>
                <option value="Terrassa">Terrassa</option>
                <option value="Sabadell">Sabadell</option>
            </select>

            <label for="category">Categoria</label>
            <select name="category" id="category">
                <option value="cadet">Cadet</option>
                <option value="junior">Junior</option>
                <option value="senior">Senior</option>
            </select>

            <label for="mail">Mail</label>
            <input type="email" id="mail" name="mail">

            <label for="password">Contrasenya</label>
            <input type="password" id="password" name="password">

            <input class="button" type="submit">
        </form>
    </section>
    <RouterLink to="/login">Logar-se</RouterLink>

</template>
<script>
export default {
    name:'RegisterComponent',
    data() {
      return {
        newUser: {
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
      addUser() {
        console.log("Creando un nuevo usuario...");
        axios.post('auth/register', this.newUser)
          .then(response => {
            console.log('Usuario ha sido agregado:', response.data);
            this.clearForm();
          })
          .catch(error => {
            console.error('Error al agregar el usuario:', error);
          });
      },
      clearForm() {
        this.newUser = {
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

<style>


</style>