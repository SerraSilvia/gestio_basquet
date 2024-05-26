<template>
    <div class="tournament-item">
        <div >
            <h3>Id torneig: {{ tournament.id }}</h3>
         
        </div>
       

    </div>
</template>
<script>
export default {
    name: 'TournamentsComponent',
    props: {
        tournament: {
            tournament: Object,
            required: true
        }
    },
};
</script>

<style scoped>


</style>