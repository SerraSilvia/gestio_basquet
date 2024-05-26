<template>
    <section>
      <h2>Selecciona el club</h2>
      <div>
        <ClubSelectComponent @selected-club="handleSelectedClub"></ClubSelectComponent>
      </div>
    </section>
  
    <section id="teams-section">
      <h2>Tornejos de {{ clubName }}</h2>
      <TournamentsComponent v-for="(tournament, index) in tournaments" :key="index" :tournament="tournament" ></TournamentsComponent>
    </section>
  </template>
  
  <script>
  import TournamentsComponent from './TournamentsComponent.vue';
  import ClubSelectComponent from './ClubSelectComponent.vue';
  
  export default {
    name: 'RankingsComponent',
    data() {
      return {
        clubName: "Barcelona",
        tournaments: [],
        club_id: 1,
      };
    },
    components: {
      ClubSelectComponent,
      TournamentsComponent
    },
    methods: {
      handleSelectedClub(selectedClub) {
        this.club_id = selectedClub;
        this.$axios.get('locations/?id=' + this.club_id)
          .then(response => {
            this.clubName = response.data[0].name;
            this.getTournaments();
          })
          .catch(error => {
            console.error('Error al intentar obtener el club', error);
          });
      },
      getTournaments() {
        this.$axios.get('tournaments/?location_id=' + this.club_id)
          .then(response => {
            console.log("tornejos: "+ response.data)
            this.tournaments = response.data;
          })
          .catch(error => {
            console.error('Error al intentar obtener los torneos', error);
          });
      }
    },
    mounted() {
      this.getTournaments();
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
  </style>
  