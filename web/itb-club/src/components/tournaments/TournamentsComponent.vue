<template>
   <RouterLink :to="`/tornejos/${tournament.id}`">
        <div class="tournament-item">
            <h3>{{ tournament.name }}</h3>
            <p>{{ selectedTournamentClub.name }}</p>
            <p>{{ tournament.date_start }} / {{ tournament.date_end }}</p>
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
            selectedTournamentClub: {}
        };
    },
    methods: {
        getClubSelected() {
            console.log("location del tournament:"+this.tournament.location_id);//TODO: esto siempre da barcelona(?)
            this.$axios.get(`locations/?id=` + this.tournament.location_id)
                .then(response => {
                    this.selectedTournamentClub = response.data[0];
                    console.log("nom del club seleccionat: "+ response.data[0].name)
                })
                .catch(error => {
                    console.error('Error al intentar obtener el club', error);
                });
        }
    },
    mounted() {
        this.getClubSelected();
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

a:hover{
    color: #f94d7b;
}
</style>
