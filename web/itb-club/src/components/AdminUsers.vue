<template>
    <p>Aqui se mostraran todos los usuarios</p>
    <input type="text" v-model="searchQuery" placeholder="Buscar jugador per email">
    <UserItemComponent v-for="(user, index) in sortedUsers" :key="user.id" ></UserItemComponent>
</template>
  
<script>
import UserItemComponent from "./UserItemComponent.vue"

export default {
    name: 'AdminUsers',
    data(){
        return{
            user:[],
            users: [],
            searchQuery: ''

        }
    },
    components:{
        UserItemComponent
    },
    computed:{

      sortedUsers() {
        return this.users
          /*.slice()
          .filter(user => user.email.toLowerCase().includes(this.searchQuery.toLowerCase()));*/
      }
    },
    methods:{   
        getUsers(){
            console.log("se consiguen los usuarios");
            this.$axios.get('people/')
                .then(response => {
                    console.log("club: " + response.data[0]);
                    this.users = response.data[0];
                })
                .catch(error => {
                    console.error('Error al intentar obtener el club', error);
                });
        }
    },
    mounted(){
        const userData = JSON.parse(sessionStorage.getItem('userData'));
        if(userData) {
            this.user = userData;
            if(this.user.user_type=="admin"||this.user.user_type=="employee"||this.user.user_type=="professor"){
            }else this.$router.push({ path: '/' });
            this.getUsers();
        } else {
            this.$router.push({ path: '/' });
        }
    }
};

</script>
  
<style scoped></style>
  