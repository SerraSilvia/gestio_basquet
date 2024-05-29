<template>
    <header>
       <IconMenu @click="toggleMenu"/>
       <h1><RouterLink to="/">ITBClub</RouterLink></h1>
       <RouterLink to="/login"><IconLogin/></RouterLink>
    </header>
    <NavigationComponent v-show="visibleMenu" class="position-top" @toggle-menu="toggleMenu"></NavigationComponent>
</template>

<script>
import IconMenu from './icons/IconMenu.vue';
import IconLogin from './icons/IconLogin.vue';
import NavigationComponent from './NavigationComponent.vue';

export default {
    name: 'HeaderComponent', 
    components: {
        IconMenu,
        IconLogin,
        NavigationComponent
    },
    data() {
        return {
            visibleMenu: false
        };
    },
    methods: {
        toggleMenu() {
            if(this.visibleMenu) this.visibleMenu=false;
            else this.visibleMenu=true;
        }
    }
};
</script>

<style scoped>
.position-top{
    top: 64px;
    position: fixed;
}
header{
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    background: rgb(244,93,69);
    background: linear-gradient(90deg, rgba(244,93,69,1) 0%, rgba(249,77,123,1) 100%);
    padding: 1em;
    display: flex;
    justify-content: space-between;
    z-index: 10;
    align-items: center;
}

</style>
