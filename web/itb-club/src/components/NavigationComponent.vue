<template>
    <div class="overlay-menu">
        <div class="menu-container">
            <nav>
                <ul>
                    <li><RouterLink @click="handleToggleMenu" to="/">Inici</RouterLink></li>
                    <li><RouterLink @click="handleToggleMenu" to="/about">Nosaltres</RouterLink></li>
                    <li><RouterLink @click="handleToggleMenu" to="/tornejos">Tornejos</RouterLink></li>
                    <li><RouterLink @click="handleToggleMenu" to="/rankings">Rankings</RouterLink></li>
                    <li><RouterLink @click="handleToggleMenu" to="/reserva">Reserva</RouterLink></li>
                    <li><RouterLink @click="handleToggleMenu" to="/equips">Equips</RouterLink></li>
                    <li><RouterLink @click="handleToggleMenu" to="/usuari">Usuari</RouterLink></li>
                <li><RouterLink @click="handleToggleMenu" to="/administrar">Administrar</RouterLink></li>

                </ul>
            </nav> 
        </div>
    </div>
</template>

<script>
import IconMenu from './icons/IconMenu.vue';

export default {
    name:'NavigationMenu', 
    components: {
        IconMenu
    },
    methods:{
        handleToggleMenu(){
            this.$emit('toggle-menu');

        }
    }
};
</script>

<style scoped>
.overlay-menu {
    background-color: rgba(0, 0, 0, .5);
    width: 100%;
    z-index: 10;
}
.menu-container{
    width: 10em;
    background: rgb(244,93,69);
    padding: 1.5em 1em;
    height: 100vh;
    z-index:3;
}
    nav{
        margin: 1em 0em;
        display: flex;
        flex-direction: column; 
    }

    nav li{
        text-transform: uppercase;
        text-decoration: none;
        color: black;
        margin-top: 0.5em;
    }
    
</style>