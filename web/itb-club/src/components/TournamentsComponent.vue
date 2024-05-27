<template>
    <RouterLink :to="`/tornejos/${tournament.id}`">
        <div class="tournament-item">
            <h3>{{ tournament.name }}</h3>
            <p>{{ club.name }}</p>
            <p>{{ tournament.start_date }} / {{ tournament.end_date }}</p>
        </div>
    </RouterLink>
</template>

<script>
export default {
    name: 'TournamentsComponent',
    props: {
        tournament: {
            type: Object,
            required: true
        }
    },
    data() {
        return {
            club: {}
        };
    },
    methods: {
        getClub() {
            console.log(this.tournament.location_id);//TODO: esto siempre da barcelona(?)
            this.$axios.get(`locations/?id=` + this.tournament.location_id)
                .then(response => {
                    console.log("club: " + response.data[0]);
                    this.club = response.data[0];
                })
                .catch(error => {
                    console.error('Error al intentar obtener el club', error);
                });
        }
    },
    mounted() {
        this.getClub();
    }
};
</script>

<style scoped>
.tournament-item {
    background-color: #eff9f6;
    margin: 10px 0;
    padding: 15px;
    border-radius: 8px;
}

.tournament-item:hover {
    box-shadow: 0.15em 0.15em #f94d7b;
}
</style>
