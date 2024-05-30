<template>
    <div class="tournament-item">
        <div class="info">
            <RouterLink :to="`/tornejos/${tournament.id}`">
                <h3>{{ tournament.name }}</h3>

                <p>{{ selectedTournamentClub.name }}</p>
                <p>{{ tournament.date_start }} / {{ tournament.date_end }}</p>
            </RouterLink>

        </div>
        <div class="buttons" v-if="this.user.user_type != 'player' && this.user.user_type != 'captain'">
            <button @click="deleteTournament">Eliminar</button>
            <button @click="modifyTournament">Modificar</button>
        </div>

    </div>
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
            selectedTournamentClub: {},
            user: []
        };
    },
    methods: {
        getClubSelected() {
            this.$axios.get(`locations/?id=` + this.tournament.location_id)
                .then(response => {
                    this.selectedTournamentClub = response.data[0];
                    console.log("nom del club seleccionat: " + response.data[0].name)
                })
                .catch(error => {
                    console.error('Error al intentar obtener el club', error);
                });
        },
        deleteTournament() {
            this.$axios.delete(`tournaments/?id=` + this.tournament.id)
                .then(response => {
                    window.location.reload();
                })
                .catch(error => {
                    console.log('Error al intentar eliminar el torneo', error);
                });
        },
        modifyTournament() {
            console.log("se modifica un tournament");
            this.$router.push({ path: `/tornejos/modificar/${this.tournament.id}` });

        }
    },
    mounted() {
        this.getClubSelected();
        const userData = JSON.parse(sessionStorage.getItem('userData'));
        if (userData) {
            this.user = userData;
        } else {
            this.$router.push({ path: '/login' });
        }
    }
};
</script>

<style scoped>
.tournament-item {
    background-color: #eff9f6;
    margin: 10px 0;
    padding: 15px;
    border-radius: 8px;
    display: flex;
}

.tournament-item:hover {
    box-shadow: 0.15em 0.15em #f94d7b;
}

a:hover {
    color: #f94d7b;
}

.buttons {
    width: 15%;
}

.info {
    width: 85%;
}

button {
    width: 6em;
}
</style>
