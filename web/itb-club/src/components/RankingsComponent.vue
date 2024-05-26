<template>
    <section>
      <h2>Selecciona el club</h2>
      <div>
        <ClubSelectComponent @selected-club="handleSelectedClub"></ClubSelectComponent>
      </div>
    </section>
  
    <section id="teams-section">
      <h2>Ranking de {{ clubName }}</h2>
      <input type="text" v-model="searchQuery" placeholder="Buscar equip per nom">
      <div v-for="(team, index) in sortedTeams" :key="team.id">
        <p class="number">{{ index + 1 }}</p><!--TODO: hacer que el indice no cambie segun la busqueda, que sea una propiedad mas del team-->
        <EquipComponent class="team-item" :team="team"></EquipComponent>
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
        searchQuery: ''
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
          .catch(error => {
            console.error('Error al intentar obtener la ubicación', error);
          });
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
    computed: {
      sortedTeams() {
        return this.teams
          .slice()
          .sort((a, b) => b.total_score - a.total_score)
          .filter(team => team.name.toLowerCase().includes(this.searchQuery.toLowerCase()));
      }
    },
    mounted() {
      this.getTeams();
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
  