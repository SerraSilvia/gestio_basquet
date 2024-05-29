<template>
    <div class="comment-item">
      <div class="comment-info">
        <p>Autor: {{ author ? `${author.name} ${author.surnames}` : 'Carregant...' }}</p>
        <p>Creat: {{ comment.created_at }}</p>
        <p v-if="comment.deleted_at == null">Modificat: {{ comment.updated_at }}</p>
        <p v-else>Eliminat: {{ comment.deleted_at }}</p>
      </div>
      <div class="comment-text">
        <p v-if="comment.deleted_at == null">{{ comment.comment }}</p>
        <p v-else>Comentari eliminat</p>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    name: 'CommentComponent',
    props: {
      comment: {
        type: Object,
        required: true
      }
    },
    data() {
      return {
        author: null
      };
    },
    methods: {
      getAuthor() {
        this.$axios.get(`people/?id=${this.comment.person_create_id}`)
          .then(response => {
            this.author = response.data[0];
          })
          .catch(error => {
            console.error('Error al obtener datos del jugador:', error);
          });
      }
    },
    mounted() {
      this.getAuthor();
    }
  };
  </script>
  
  <style scoped>
  .comment-item {
    background-color: #4fccc1;
    padding: 1em;
    border-radius: 0.5em;
    color: white;
    margin: 0.5em 0em;
  }
  
  .comment-item p {
    color: white;
    font-size: 1em;
  }
  
  .comment-info {
    display: flex;
    justify-content: space-between;
    font-size: 0.75em;
  }
  
  .comment-text {
    margin: auto;
    background-color: white;
    border-radius: 0.5em;
  }
  
  .comment-text p {
    margin-top: 0.5em;
    color: #f94d7b;
    text-align: justify;
    padding: 1em;
  }
  </style>
  