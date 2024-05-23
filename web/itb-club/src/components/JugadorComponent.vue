<template>
    <p class="player">Esto es un jugador:{{ player }}</p>
</template>
<script>
export default {
    name:'JugadorComponent',
    props: {
        player: {
            type: Number,
            required: true
        }
    },
};
</script>
<style>
.player{
background-color: red;
}    
</style>