<template>
  <section id="tournaments-container">
    <h2>Selecciona el club</h2>
    <div>
      <ClubSelectComponent @selected-club="handleSelectedClub"></ClubSelectComponent>
    </div>
  </section>
  <div>
    <button @click="createTournament" v-if="user.user_type=='admin'">Crear torneig</button>
  </div>
  <section id="teams-section">
    <h2 v-if="selectedClub">Tornejos de {{ selectedClub.name }}</h2>
    <h2 v-else>Selecciona un club per veure els tornejos</h2>
    <TournamentsComponent v-for="(tournament, index) in tournaments" :key="tournament.id" :tournament="tournament"></TournamentsComponent>
  </section>
</template>

<script>
import TournamentsComponent from './TournamentsComponent.vue';
import ClubSelectComponent from './ClubSelectComponent.vue';

export default {
  name: 'ViewTournaments',
  data() {
    return {
      selectedClub: null,
      tournaments: [],
      club_id: null,
      user:{}
    };
  },
  components: {
    ClubSelectComponent,
    TournamentsComponent
  },
  methods: {
    handleSelectedClub(selectedClub) {
      this.club_id = selectedClub;
      this.getTournaments();
      this.$axios.get('locations/?id=' + selectedClub)
        .then(response => {
          this.selectedClub = response.data[0];
        })
        .catch(error => {
          console.error('Error al intentar obtener el club', error);
        });
    },
    getTournaments() {
      this.$axios.get('tournaments/?location_id=' + this.club_id)
        .then(response => {
          this.tournaments = response.data;
        })
        .catch(error => {
          console.error('Error al intentar obtener los torneos', error);
        });
    }, 
    createTournament(){
      this.$router.push({ path: '/tornejos/crear' });

    }
  }, 
  mounted(){
    const userData = JSON.parse(sessionStorage.getItem('userData'));
    if (userData) {
      this.user = userData;
    } else {
      this.$router.push({ path: '/' });
    }
  }
};
</script>

<style scoped>
input[type="text"] {
  width: 100%;
  padding: 0.5em;
  margin-bottom: 2em;
  border: 1px solid #ffffff;
  border-radius: 0.5em;
  box-shadow: 0.25em 0.25em #f94d7b;
}

.team-item {
  margin-bottom: 1em;
}

#teams-section div {
  display: flex;
}

.team-item {
  width: 90%;
}

.number {
  margin: auto;
  font-size: 2em;
  font-weight: bold;
  color: #f45a45;
}

#tournaments-container, #teams-section {
  padding: 5% 10%;
}
</style>
