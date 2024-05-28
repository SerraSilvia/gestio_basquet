<template>
    <h2>Administrar Comentaris de {{ id }}</h2>
    <section v-if="user && user.user_type === 'player' && comments.length > 0">
        <h3>Comentaris</h3>
        <CommentComponent v-for="(comment, index) in comments" :key="index" :comment="comment"></CommentComponent>
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
    }
    ,
    data() {
        return {
            logedUser: {},
            user: {},
            comments: []
        }
    },
    methods: {
        getComments() {
            if (this.user && this.user.id) {
                this.$axios.get(`comments/?person_id=${this.user.id}`)
                    .then(response => {
                        this.comments = response.data;
                    })
                    .catch(error => {
                        console.error('Error al intentar obtener los comentarios', error);
                    });
            }
        },
        getUserData() {
            if (this.user && this.user.id) {
                this.$axios.get(`people/?id=` + this.id)
                    .then(response => {
                        console.log("usuari:"+ response.data[0]);
                        this.user = response.data[0];
                    })
                    .catch(error => {
                        console.error('Error al intentar obtener el usuario', error);
                    });
            }
            this.getComments();
        }
    },
    mounted() {
        const userData = JSON.parse(sessionStorage.getItem('userData'));
        if (userData) {
            this.logedUser = userData;
            if (this.logedUser.user_type == "admin" || this.logedUser.user_type == "professor") {
                console.log("hola usuari autoritzat");
                this.getUserData();
            } else this.$router.push({ path: '/' });


        } else {
            this.$router.push({ path: '/' });
        }
    }
}

</script>

<style scoped></style>