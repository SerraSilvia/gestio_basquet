<template>
    <p>Aqui se mostraran todos los usuarios</p>
</template>
  
<script>


export default {
    name: 'AdminUsers',
    data(){
        return{
            user:[]
        }
    },
    mounted(){
        const userData = JSON.parse(sessionStorage.getItem('userData'));
        if(userData) {
            this.user = userData;
            if(this.user.user_type=="admin"||this.user.user_type=="employee"||this.user.user_type=="professor"){
                console.log("hola usuario autorizado");
            }else this.$router.push({ path: '/' });
        } else {
            this.$router.push({ path: '/' });
        }
    }
}

</script>
  
<style scoped></style>
  