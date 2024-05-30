<template>
    
    <div class="container">
        <div v-if="user" class="avatar-content">
            <img :src="userImageSrc" alt="user_img" class="user-img" />
        </div>
        <div class="user-info">
            <h3>Email: {{ user.email }}</h3>
            <p>ID usuari: {{ user.id }}</p>
            <p class="capitalize">tipus: {{ user.user_type }}</p>
            <p v-if="user.team_id!=null&&user.team_id!=undefined">ID equip: {{ user.team_id }}</p>
        </div>
        <div class="button-container">
            <RouterLink class="button-pink" :to="`/administrar/comments/${user.id}`">Comentaris</RouterLink>
            <button id="deleteAcount" class="button-pink" @click="deleteAcount">Eliminar</button>
            <button id="modifyAcount" class="button-pink" @click="modifyAcount">Modificar</button>
        </div>
    </div>
</template>

<script>
import defaultAvatar from "@/assets/images/avatar_default.png";

export default {
    name: 'userItemComponent.vue',
    props: {
        user: {
            type: Object,
            required: true
        }

    },
        computed: {
        userImageSrc() {
            // Return the user's image if available, otherwise the default image
            return this.user && this.user.image ? this.user.image : defaultAvatar;
        }
    },
    methods: {
        deleteAcount() {
            if (this.user && this.user.id) {
                this.$axios.delete(`people/?id=${this.user.id}`)
                    .then(response => {
                        console.log('Cuenta eliminada');
                        this.$router.push({ path: '/administrar/users' });
                        window.location.reload();
                    })
                    .catch(error => {
                        console.error('Error al intentar eliminar la cuenta', error);
                    });
            }
        },
        modifyAcount() {
            if (this.user && this.user.id) {
                console.log("se modifica el usuario");
                this.$router.push({ path: `/modify/user/${this.user.id}` });
            }
        }
    }

};

</script>

<style scoped>
.container {
    display: flex;
    background-color: #4fccc1;
    border-radius: 1em;
    padding: 0.5em;
    flex-wrap: wrap;
    justify-content: space-between;
    margin-bottom: 0.5em;
}

.user-img {
    width: 5em;
    height: 5em;
    border-radius: 50%;
    object-fit: cover;
    margin-left:30px;
}

.user-info{
    width: 30em;
}
.button-container{
    width: 100%em;
    display: flex;
    flex-direction: column;
    align-items: center;
}
.button-container button,
.button-container a{
    margin-bottom: 0.25em;
    width: 100%;
    max-width: 12em;
    padding: 0.5em;
    text-align: center;
    color: white;
    border: 2px solid white;
    box-sizing: border-box;
}

p{
    padding-bottom:12px;

}
h3{
    padding-bottom: 12px;
}
.button-pink {
    font-size: 1rem;
}
</style>