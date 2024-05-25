<template>
    <section>
        <h2>Selecciona el club</h2>
        <div>
            <ClubSelectComponent @selected-club="handleSelectedClub"></ClubSelectComponent>
        </div>
    </section>

    <section>
        <h2>Equips a {{ clubName }}</h2>
        <div>
            <EquipComponent class="team-item" v-for="(team, index) in teams" :key="index" :team="team" @selected-team="handleSelectedTeam"></EquipComponent>
        </div>
    </section>
    <p class="button-container">
        <RouterLink class="button" to="/equips/crear">Crear Equip</RouterLink>
    </p>
</template>

<script>
import axios from 'axios'; 
import EquipComponent from './EquipComponent.vue';
import ClubSelectComponent from './ClubSelectComponent.vue';

export default {
    name: 'EquipsComponent',
    data() {
        return {
            clubName: "Barcelona",
            teams: [],
            club_id: 1, // Añadir club_id
        };
    },
    components: {
        EquipComponent,
        ClubSelectComponent
    },
    methods: {
        handleSelectedClub(selectedClub) {
            this.club_id = selectedClub;
            axios.get('http://localhost/gestio_basquet/api/routes/locations/?id=' + this.club_id)
                .then(response => {
                    this.clubName = response.data[0].name;
                    this.getTeams();
                })
        },
        handleSelectedTeam(id) {
            console.log("Se clica un equipo, con id:" + id);
        },
        getTeams() {
            this.$axios.get('teams/?location_id=' + this.club_id)
                .then(response => {
                    this.teams = response.data;
                })
                .catch(error => {
                    console.error('Error al intentar obtener los equipos', error);
                });
        }
    },
    mounted() {
        this.getTeams(); 
    }
};
</script>

<style>
.button-container {
    display: flex;
    justify-content: center;
    margin: 20px 0;
}

.button {
    transition: background-color 0.3s ease;
}

section {
    padding: 0 7.5%;
}

.team-item {
    margin: 0.2em;
}
</style>
