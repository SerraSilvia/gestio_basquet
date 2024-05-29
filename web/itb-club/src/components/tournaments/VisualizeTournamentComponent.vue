<template>
  <div v-if="tournamentSelected" class="container">
    <h2>{{ tournamentSelected.name }}</h2>
    <div class="tournament-info">
      <div class="location">
             <IconLocation></IconLocation>
            <p>{{ tournamentClub.name }}</p>
      </div>
      <p>{{ tournamentSelected.date_start }}</p>
      <p>{{ tournamentSelected.date_end }}</p>
    </div>
    <div class="tournament-status">
      {{ status }}
    </div>
    <div class="tournament-teams">

    </div>
  </div>
</template>

<script>
import IconLocation from "../icons/IconLocation.vue";
export default {
  name: "VisualizeTournamentComponent",
  props: {
    id: {
      type: String,
      required: true,
    }
  },
  data() {
    return {
      tournamentSelected: [],
      tournamentClub: [],
      status:'null',
      teams:[]
    };
  },
  components:{
    IconLocation
  },
  methods: {
    getTournament() {
      this.$axios.get(`tournaments/?tournament_id=` + this.id)
        .then(response => {
          this.tournament = response.data[0];
          this.getClub();

        })
        .catch(error => {
          console.error('Error al intentar obtener el torneo', error);
        });
    },
    getClub() {
      console.log("tournament.loctions_id: "+ this.tournamentSelected.location_id);
      this.$axios.get(`locations/?id=` + this.tournamentSelected.location_id)
        .then(response => {
          console.log("club: "+ response.data[0].name)
          this.tournamentClub = response.data[0];
        })
        .catch(error => {
          console.error('Error al intentar obtener el club', error);
        });
    }
  },
  mounted() {
    this.getTournament();
  }
};
</script>

<style scoped>
.container {
  background-color: #4fccc1;
  padding: 1.5em;
  color: white;
  width: 75%;
  border-radius: 2em;
  margin: 2em auto;
}

.container h2 {
  color: black;
}
</style>
