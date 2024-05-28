<template>
    <h2>Administrar</h2>
    <section>
        <h3>Usuaris</h3>
        <ul>
            <li><RouterLink @click="handleToggleMenu" to="/administrar/users">Mirar Usuaris</RouterLink></li>
        </ul>
    </section>
</template>
  
<script>


export default {
    name: 'AdministrarComponent',
    data() {
        return {
            user: [],
            newUserMail:"",
        }
    },
    mounted(){
        const userData = JSON.parse(sessionStorage.getItem('userData'));
        if(userData) {
            this.user = userData;
            if(this.user.user_type=="admin"){
                console.log("hola admin")
            }else this.$router.push({ path: '/' });


        } else {
            this.$router.push({ path: '/' });
        }
    }
}

</script>
  
<style scoped></style>
  