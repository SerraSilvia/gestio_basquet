<template>
  <div class="game">
    <h3>{{ team1.name }} vs {{ team2.name }}</h3>
    <div v-if="displayButtons">
      <p>Selecciona el ganador:</p>
      <button @click="clickTeam1">{{ team1.name }}</button>
      <button @click="clickTeam2">{{ team2.name }}</button>
    </div>
    <div v-else>
      <p>Guanyador: {{ winner }}</p>
    </div>
  </div>
</template>

<script>
export default {
  name: "GameItem",
  props: {
    game: {
      type: Object,
      required: true
    }
  },
  data() {
    return {
      team1: {},
      team2: {},
      winner: '',
      winnerId:'',
      user: null,
      displayButtons: false,
      updatedGame: {}
    };
  },
  methods: {
    async clickTeam1() {
      this.$emit("selected-winner", [1, this.game.team1_id, this.game.tournament_position]);

      this.updatedGame.score_t1 = "15";
      this.updatedGame.score_t2 = "12";
      await this.updateGame();
    },
    async clickTeam2() {
      this.$emit("selected-winner", [2, this.game.team2_id, this.game.tournament_position]);
      this.displayButtons = false;

      this.updatedGame.score_t2 = "21";
      this.updatedGame.score_t1 = "18";
      await this.updateGame();
    },
    async updateGame() {
      try {
        console.log("datos actualizados de equipo:", this.updatedGame);
        await this.$axios.put(`games/?id=${this.game.id}`, this.updatedGame);
      } catch (error) {
        console.error('Error al intentar modificar el partido y los puntos del equipo:', error);
      }
    },
    async getTeamsInfo() {
      try {
        // información del equipo 1
        const response1 = await this.$axios.get(`teams/?id=${this.game.team1_id}`);
        this.team1 = response1.data[0];

        // información del equipo 2
        const response2 = await this.$axios.get(`teams/?id=${this.game.team2_id}`);
        this.team2 = response2.data[0];

        this.getWinner();
        this.checkDisplayButtons();
      } catch (error) {
        console.error('Error al obtener información de los equipos:', error);
      }
    },
    getWinner() {
      if (this.game.score_t1 !== 0 || this.game.score_t2 !== 0) {
        if (this.game.score_t1 === this.game.score_t2) {
          this.winner = this.team1.id;
          this.winnerId=this.team1.name;
        } else {
          this.winner = this.game.score_t1 > this.game.score_t2 ? this.team1.name : this.team2.name;
          this.winnerId = this.game.score_t1 > this.game.score_t2 ? this.team1.id : this.team2.id;
        }
      }
    },
    checkDisplayButtons() {
      if ((this.game.score_t1 === 0 && this.game.score_t2 === 0 || this.game.score_t1 === this.game.score_t2) && this.user && this.user.user_type === 'admin') {
        this.displayButtons = true;
      }
    }
  },
  async mounted() {
    const userData = JSON.parse(sessionStorage.getItem('userData'));
    this.user = userData;
    this.updatedGame = this.game;
    await this.getTeamsInfo();
  }
};
</script>

<style>
.game {
  background-color: white;
  padding: 1em;
  margin: 2.5% 10%;
  border-color: aqua;
  border-width: 3px;
  border-style: solid;
  border-radius: 1em;
}
</style>
