<template>
    <header>
       <IconMenu @click="toggleMenu"/>
       <h1>ITBClub</h1>
       <IconLogin @click="clickGoToLogin"/>
    </header>
</template>
<script>
import IconMenu from './icons/IconMenu.vue';
import IconLogin from './icons/IconLogin.vue';


export default {
    name:'HeaderComponent', 
    components: {
        IconMenu,
        IconLogin
    },
    methods:{
        toggleMenu(){
            console.log("click menu");
        },
        clickGoToLogin(){
            console.log("click go to login");
        }
    }
};
</script>

<style>
    header{
        background: rgb(244,93,69);
        background: linear-gradient(90deg, rgba(244,93,69,1) 0%, rgba(249,77,123,1) 100%);
        padding: 1em;
        display: flex;
        justify-content: space-between;
    }
    h1{
        color: white;
        text-transform: uppercase;
        font-size: 1.5em;
    }
</style>