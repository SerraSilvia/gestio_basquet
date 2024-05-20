<template>
    <div class="menu-container">
        <IconMenu @click="handleToggleMenu"/>
       <nav>
            <RouterLink @click="handleToggleMenu" to="/">Inici</RouterLink>
            <RouterLink @click="handleToggleMenu" to="/about">Nosaltres</RouterLink>
            <RouterLink @click="handleToggleMenu" to="/tornejos">Tornejos</RouterLink>
            <RouterLink @click="handleToggleMenu" to="/rankings">Rankings</RouterLink>
            <RouterLink @click="handleToggleMenu" to="/reserva">Reserva</RouterLink>
            <RouterLink @click="handleToggleMenu" to="/equips">Equips</RouterLink>
            <RouterLink @click="handleToggleMenu" to="/usuari">Usuari</RouterLink>
        </nav> 
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

<style>

.menu-container{
    width: 10em;
    background: rgb(244,93,69);
    padding: 1em;
    height: 100%
}
    nav{
        margin: 1em 0em;
        display: flex;
        flex-direction: column; 
    }
    
</style>