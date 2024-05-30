<template>
    <h2>Administrar</h2>
    <div class="title-poligon"></div>
    <section class="admin-card">
        <h3>Usuaris:</h3>
        <ul>
            <li class="button-pink"><RouterLink @click="handleToggleMenu" to="/administrar/users">Mirar Usuaris</RouterLink></li>
        </ul>
        <h3>Reserves:</h3>
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
  
<style scoped>
h3, h2{
    font-size: 30px;
    padding-top: 5px ;
    margin-left: 20px;

}
.admin-card{
    margin-top:150px;
    margin-left:50px;
}

.button-pink {
  border-color: white;
  border-style: solid;
  color: white;
  font-weight: bolder;
  text-decoration: none;
  text-transform: lowercase;
  background-color: #f94d7b;
  padding: 0.25em 0.75em;
  border-radius: 1em;
}

.button-pink:hover {
  background-color: #ff7a9d;
}
li{
    padding-bottom:30px;
    padding-top:30px;
    margin-left: 100px;
    width: 10%;
    text-align: center;
    
}
</style>
  