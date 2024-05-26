<template>
    <section>
        <h2>Selecciona el club</h2>
        <div>
            <ClubSelectComponent @selected-club="handleSelectedClub"></ClubSelectComponent>
        </div>
    </section>

    <section>
        <h2>Equips a {{ clubName }}</h2>
        <p>Aqui habra una barra de busqueda</p>
        <div>
            <EquipComponent class="team-item" v-for="(team, index) in teams" :key="index" :team="team"></EquipComponent>
        </div>
    </section>
</template>
<script>
import EquipComponent from './EquipComponent.vue';
import ClubSelectComponent from './ClubSelectComponent.vue';

export default {
    name: 'RankingsComponent',
    data() {
        return {
            clubName: "Barcelona",
            teams: [],
            club_id: 1,
        };
    },
    components: {
        EquipComponent,
        ClubSelectComponent
    },
    methods: {
        handleSelectedClub(selectedClub) {
            this.club_id = selectedClub;
            this.$axios.get('locations/?id=' + this.club_id)
                .then(response => {
                    this.clubName = response.data[0].name;
                    this.getTeams();
                })
        },
        getTeams(){
            this.$axios.get('teams/?location_id=' + this.club_id)
                .then(response => {
                    this.teams = response.data;
                })
                .catch(error => {
                    console.error('Error al intentar obtener los equipos', error);
                });
        }
    }
};
</script>