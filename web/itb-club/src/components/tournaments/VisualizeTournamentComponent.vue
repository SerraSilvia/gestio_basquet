<template>
  <div v-if="tournamentSelected" class="container">
    <div class="display-flex">
      <h2>{{ tournamentSelected.name }}</h2>
      <div class="location">
        <IconLocation></IconLocation>
        <p>{{ tournamentClub ? tournamentClub.name : 'Carregant..' }}</p>
      </div>
    </div>
    <div class="tournament-info"> 
      <p class="resaltat estat">{{ status }}</p>
      <p class="resaltat">{{ tournamentSelected.date_start }} / {{ tournamentSelected.date_end }}</p>
    </div>
    <div v-if="teams.length > 0" class="tournament-teams">
      <EquipComponent class="team-item" v-for="(team, index) in teams" :key="index" :team="team"></EquipComponent>
    </div>
    <div v-else>
      <p class="no-teams-message">No hi ha equips inscrits</p>
    </div>
    <button @click="addMyTeam" v-if="user.user_type=='captain' && teams.length<8 && status=='Inscripcions Obertes'">Incriure el meu equip</button>
  </div>
</template>

<script>
import IconLocation from "../icons/IconLocation.vue";
import EquipComponent from "../EquipComponent.vue";

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
      tournamentSelected: null,
      tournamentClub: null,
      status: null,
      teams: [],
      user:[]
    };
  },
  components: {
    IconLocation,
    EquipComponent
  },
  methods: {
    async getTournament() {
      try {
        const response = await this.$axios.get(`tournaments/?id=` + this.id);
        this.tournamentSelected = response.data[0];
        await this.getClub();
        await this.getTeams();
        this.getStatus();
      } catch (error) {
        console.error('Error al intentar obtener el torneo', error);
      }
    },
    async getClub() {
      if (!this.tournamentSelected) {
        return;
      }
      try {
        const response = await this.$axios.get(`locations/?id=` + this.tournamentSelected.location_id);
        this.tournamentClub = response.data[0];
      } catch (error) {
        console.error('Error al intentar obtener el club', error);
      }
    },
    getStatus() {
      const currentDate = new Date();
      const dateStart = new Date(this.tournamentSelected.date_start);
      const dateEnd = new Date(this.tournamentSelected.date_end);

      if (dateStart <= currentDate && dateEnd >= currentDate) {
        this.status = "Actiu";
      } else if (dateStart > currentDate && this.teams.length < 8) {
        this.status = "Inscripcions Obertes";
      } else if (dateStart > currentDate && this.teams.length === 8) {
        this.status = "Inscripcions Tancades";
      } else {
        this.status = "Tancat";
      }
    },
    async getTeams() {
      try {
        const response = await this.$axios.get(`teams/?tournament_id=` + this.id);
        this.teams = response.data;
      } catch (error) {
        console.error('Error al intentar obtener los equipos del club', error);
      }
    }
  },
  mounted() {
        const userData = JSON.parse(sessionStorage.getItem('userData'));
        if (userData) {
            this.user = userData;
        } else {
            this.$router.push({ path: '/login' });
        }
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

.resaltat {
  color: white;
  text-align: center;
  padding: 0.5em;
  margin: 1em 3em;
  text-transform: uppercase;
}

.estat {
  background-color: rgba(249, 77, 123, 1);
  border-radius: 0.5em;
}

.display-flex {
  display: flex;
  justify-content: space-around;
}

.display-flex div {
  padding: 2.25em;
  display: flex;
}

.no-teams-message {
  color: white;
  text-align: center;
  padding: 0.5em;
  margin: 1em 3em;
}
.tournament-teams{
  background-color: white;
  padding: 1em;
  border-radius: 1em;
}


</style>
