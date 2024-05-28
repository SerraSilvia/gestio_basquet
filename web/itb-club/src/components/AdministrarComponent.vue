<template>
    <h2>Administrar</h2>
    <section>
        <h3>Usuaris</h3>
        <ul>
            <li><RouterLink @click="handleToggleMenu" to="/administrar/add-usuari">Afegir Usuari</RouterLink></li>
            <li><RouterLink @click="handleToggleMenu" to="/administrar/mod-usuari">Modificar Usuari</RouterLink></li>
            <li><RouterLink @click="handleToggleMenu" to="/administrar/delete-usuari">Eliminar Usuari</RouterLink></li>

        </ul>
    </section>

    <section>
        <h3>Tornejos</h3>
        <ul>
            <li><RouterLink @click="handleToggleMenu" to="/administrar/add-torneig">Afegir Torneig</RouterLink></li>
            <li><RouterLink @click="handleToggleMenu" to="/administrar/mod-torneig">Modificar Torneig</RouterLink></li>
            <li><RouterLink @click="handleToggleMenu" to="/administrar/delete-torneig">Eliminar Torneig</RouterLink></li>
        </ul>
    </section>

    <section>
        <h3>Pistes</h3>
        <ul>
            <li><RouterLink @click="handleToggleMenu" to="/administrar/add-facilities">Afegir Pista</RouterLink></li>
            <li><RouterLink @click="handleToggleMenu" to="/administrar/mod-facilities">Modificar Pista</RouterLink></li>
            <li><RouterLink @click="handleToggleMenu" to="/administrar/delete-facilities">Eliminar Pista</RouterLink></li>
        </ul>
    </section>
</template>
  
<script>


export default {
    name: 'AdministrarComponent',
    data() {
        return {
            user: [],
        }
    },
    mounted(){
        const userData = JSON.parse(sessionStorage.getItem('userData'));
        if(userData) {
            this.user = userData;

        } else {
            this.$router.push({ path: '/' });
        }
    }
}

</script>
  
<style scoped></style>
  