<template>
  <div v-if="tournament" class="container">
    <h2>{{ tournament.name }}</h2>
    <div class="tournament-info">
      <div class="location">
             <IconLocation></IconLocation>
            <p>{{ club.name }}</p>
      </div>
      <p>{{ tournament.date_start }}</p>
      <p>{{ tournament.date_end }}</p>
    </div>
    <div class="tournament-status">
      {{ status }}
    </div>
    <div class="tournament-teams">

    </div>
  </div>
</template>

<script>
import IconLocation from "./icons/IconLocation.vue";
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
      tournament: [],
      club: [],
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
      this.$axios.get(`locations/?id=` + this.tournament.location_id)
        .then(response => {
          this.club = response.data[0];
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
