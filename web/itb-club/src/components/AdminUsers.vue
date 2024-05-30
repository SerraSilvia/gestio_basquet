<template>
    <div id="user-id-container">
        <h2>Usuaris registrats</h2>
            <div class="title-poligon"></div>
        <div class="center-container">
            <RouterLink class="button" to="/administrar/users/add">Crear Usuari</RouterLink></div>
        <input type="text" v-model="searchQuery" placeholder="Buscar jugador per email">
        <UserItemComponent v-for="(user, index) in sortedUsers" :key="user" :user="user"></UserItemComponent>
    </div>

</template>

<script>
import UserItemComponent from "./UserItemComponent.vue"

export default {
    name: 'AdminUsers',
    data() {
        return {
            user: [],
            users: [],
            searchQuery: ''

        }
    },
    components: {
        UserItemComponent
    },
    computed: {
        sortedUsers() {
            return this.users.filter(user => user.email.toLowerCase().includes(this.searchQuery.toLowerCase()));
        }
    },
    methods: {
        getUsers() {
            console.log("se consiguen los usuarios");
            this.$axios.get('people/')
                .then(response => {
                    console.log("club: " + response.data);
                    this.users = response.data;
                })
                .catch(error => {
                    console.error('Error al intentar obtener el club', error);
                });
        }
    },
    mounted() {
        const userData = JSON.parse(sessionStorage.getItem('userData'));
        if (userData) {
            this.user = userData;
            if (this.user.user_type == "admin" || this.user.user_type == "employee" || this.user.user_type == "professor") {
            } else this.$router.push({ path: '/' });
            this.getUsers();
        } else {
            this.$router.push({ path: '/' });
        }
    }
};

</script>

<style scoped>
h2{
    margin-bottom: 0em;
}
#user-id-container {
    padding: 5% 10%;
}

input[type="text"] {
    width: 100%;
    padding: 0.5em;
    margin-bottom: 2em;
    border: 1px solid #ffffff;
    border-radius: 0.5em;
    box-shadow: 0.25em 0.25em #f94d7b;

}
.center-container {
    display: flex;
    justify-content:flex-end; 
    margin-bottom: 1em;/* Centra el botón horizontalmente */
    margin-top:100px;
}


.center-container button{
    width: 10em;
    padding: 0.5em;
}
</style>