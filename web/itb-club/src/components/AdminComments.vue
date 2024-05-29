<template>
    <h2>Administrar Comentaris de {{ user.name }} {{ user.surnames }}</h2>
    <section class="container-admin-comments" v-if="user && user.user_type === 'player' && comments.length > 0">
      <h3>Comentaris</h3>
      <CommentComponent v-for="(comment, index) in comments" :key="index" :comment="comment"></CommentComponent>
    </section>
    <section v-else class="container-admin-comments">
        <h3>No hi han comentaris</h3>
    </section>
  </template>
  
  <script>
  import CommentComponent from './CommentComponent.vue';
  
  export default {
    name: 'AdminComments',
    props: {
      id: {
        type: String,
        required: true
      }
    },
    components: {
      CommentComponent
    },
    data() {
      return {
        loggedUser: {},
        user: {},
        comments: []
      }
    },
    methods: {
      getComments() {
        this.$axios.get(`comments/?person_id=${this.user.id}`)
          .then(response => {
            console.log(response.data);
            this.comments = response.data;
          })
          .catch(error => {
            console.error('Error al intentar obtener los comentarios', error);
          });
      },
      getUserData() {
        this.$axios.get(`people/?id=${this.id}`)
          .then(response => {
            console.log("usuari:", response.data[0]);
            this.user = response.data[0];
            this.getComments();
          })
          .catch(error => {
            console.error('Error al intentar obtener el usuario', error);
          });
      }
    },
    mounted() {
      const userData = JSON.parse(sessionStorage.getItem('userData'));
      if (userData) {
        this.loggedUser = userData;
        if (this.loggedUser.user_type == "admin" || this.loggedUser.user_type == "professor") {
          console.log("hola usuari autoritzat");
          this.getUserData();
        } else {
          this.$router.push({ path: '/' });
        }
      } else {
        this.$router.push({ path: '/' });
      }
    }
  }
  </script>
  
  <style scoped>
  h2{
    margin: 10% 0% 5% 5%;
  }
.container-admin-comments{
    padding: 0em 10%;
}
</style>
  