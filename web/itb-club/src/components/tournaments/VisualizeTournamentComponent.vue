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
    <button @click="addMyTeam"
      v-if="user.user_type == 'captain' && teams.length < 8 && status == 'Inscripcions Obertes'">Incriure el meu
      equip</button>
    <button @click="createGames" v-if="user.user_type == 'admin' && teams.length == 8">Crear propers partits</button>
  </div>
  <div v-if="tournamentSelected && games.length > 0">
    <h2>Partits</h2>
    <div class="game-container">
      <GameItem v-for="(game, index) in games" :key="game.id" :game="game" @selected-winner="handleWinner"></GameItem>
    </div>
  </div>
</template>

<script>
import IconLocation from "../icons/IconLocation.vue";
import EquipComponent from "../EquipComponent.vue";
import GameItem from "../GameItem.vue";

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
      user: {}, // Cambiado a objeto
      maxRound: 0,
      games: [],
    };
  },
  components: {
    IconLocation,
    EquipComponent,
    GameItem
  },
  methods: {
    async getTournament() {
      try {
        const response = await this.$axios.get(`tournaments/?id=` + this.id);
        this.tournamentSelected = response.data[0];
        await this.getClub();
        await this.getTeams();
        this.getStatus();
        this.getGames();
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
    },
    async addMyTeam() {
      console.log("añadiendo equipo al torneo");
      try {
        const response = await this.$axios.get(`teams/?id=` + this.user.team_id);
        const updateTeam = response.data[0];
        updateTeam.tournament_id = this.tournamentSelected.id;
        await this.$axios.put(`teams/?id=${updateTeam.id}`, updateTeam);
        await this.getTeams();
        this.getStatus();
      } catch (error) {
        console.error('Error al intentar modificar el equipo', error);
      }
    },
    async createGames() {
      try {
        const response = await this.$axios.get(`games/?tournament_id=` + this.tournamentSelected.id);
        this.games = response.data;
        this.maxRound = this.games.length;
      } catch (error) {
        console.error('Error al obtener los partidos del torneo', error);
      }

      console.log("se crean los juegos");
      if (this.maxRound < 4) {
        console.log("primera ronda");
        this.gameInsert(this.teams[0], this.teams[1], 0);
        this.gameInsert(this.teams[2], this.teams[3], 1);
        this.gameInsert(this.teams[4], this.teams[5], 2);
        this.gameInsert(this.teams[6], this.teams[7], 3);
      } else if (this.maxRound < 6) {
        console.log("segunda ronda");
        // this.gameInsert(this.getWinner(0), this.getWinner(1), 4);
        // this.gameInsert(this.getWinner(2), this.getWinner(3), 5);
      } else {
        console.log("tercera ronda");
        //this.gameInsert(this.getWinner(4), this.getWinner(5), 6);
      }
    },
    async gameInsert(team1, team2, gamePos) {
      console.log("se crean los inserts");
      const newGame = {
        id_booking: 54,
        tournament_id: this.tournamentSelected.id,
        team1_id: team1.id,
        team2_id: team2.id,
        score_t1: 0,
        score_t2: 0,
        tournament_position: gamePos
      };
      try {
        const response = await this.$axios.post("games/", newGame);
        if (response.data.status !== "error") {
          console.log("Partido creado con exito");
        } else {
          console.error("Error en la creación del partido:", response.data.message);
        }
      } catch (error) {
        console.error("Error al agregar el partido:", error);
      }
    },
    async getGames() {
      try {
        const response = await this.$axios.get("games/?tournament_id=" + this.tournamentSelected.id);
        if (response.data.status !== "error") {
          this.games = response.data;
        } else {
          console.error("Error al obtener partidos ", response.data.message);
        }
      } catch (error) {
        console.error("Error al obtener partidos:", error);
      }
    },
    getWinner(gamePos) {
      const game = this.games.find(g => g.tournament_position === gamePos);
      if (!game) return null;
      return game.score_t1 >= game.score_t2 ? game.team1 : game.team2;
    },
    handleWinner(data) {
      console.log("Ganador num: " + data[0] + "Id ganador "+data[1]+" partido: " + data[2]);

      // Obtener los detalles del equipo ganador
      this.$axios.get(`teams/?id=` + data[1])
        .then(response => {
          const updateTeam = response.data[0];
          const newPoints = updateTeam.total_score + 10;

          updateTeam.total_score = newPoints;
          console.log("datos actualizados de equipo:"+ updateTeam)
          return this.$axios.put("teams/?id=" + data[1], updateTeam);
        })
        .then(updateResponse => {
          if (updateResponse.data.status !== "error") {
            console.log("Puntuación del equipo actualizada");
          } else {
            console.error("Error al actualizar la puntuación del equipo: ", updateResponse.data.message);
          }
        })
        .catch(error => {
          console.error("Error al procesar la actualización de la puntuación del equipo: ", error);
        });
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

.tournament-teams {
  background-color: white;
  padding: 1em;
  border-radius: 1em;
}

.no-teams-message {
  color: white;
  text-align: center;
  padding: 1em;
}
</style>
