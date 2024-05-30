<template>
  <div>
    <h3>{{ team1.name }} vs {{ team2.name }}</h3>
    <div>
      <p>{{ team1.name }}: {{ game.score_t1 }}</p>
      <p>{{ team2.name }}: {{ game.score_t2 }}</p>
    </div>
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
      displayButtons: false,
      team1: {},
      team2: {},
      winner: '',
      user: null,
      updatedTeam: {}
    };
  },
  methods: {
    async clickTeam1() {
      this.$emit("selected-winner", [1, this.game.team1_id, this.game.tournament_position]);
      this.displayButtons = false;

      this.game.score_t1 = 15;
      this.game.score_t2 = 12;
      await this.updateGameAndPoints(this.game.team1_id, this.updatedTeam); // Cambiado a updatedTeam
    },
    async clickTeam2() {
      this.$emit("selected-winner", [2, this.game.team2_id, this.game.tournament_position]);
      this.displayButtons = false;

      this.game.score_t2 = 21;
      this.game.score_t1 = 18;
      await this.updateGameAndPoints(this.game.team2_id, this.updatedTeam); // Cambiado a updatedTeam
    },
    async updateGameAndPoints(id, team) {
      try {
        const newPoints = parseInt(team.total_score , 10)+10;
        team.total_score = newPoints;

        console.log("datos actualizados de equipo:", newPoints);
        /*await this.$axios.put("teams/?id=" + id, team);
        
        await this.$axios.put(`game/?id=${this.game.id}`, this.game);*/
      } catch (error) {
        console.error('Error al intentar modificar el partido y los puntos del equipo:', error);
      }
    },
    async getTeamsInfo() {
      try {
        // información del equipo 1
        const response1 = await this.$axios.get(`teams/?id=${this.game.team1_id}`);
        this.team1 = response1.data[0];

        //  información del equipo 2
        const response2 = await this.$axios.get(`teams/?id=${this.game.team2_id}`);
        this.team2 = response2.data[0];

        if (this.game.score_t1 === 0 && this.game.score_t2 === 0 && this.user && this.user.user_type === "admin") {
          this.displayButtons = true;
        } else {
          this.getWinner();
        }
      } catch (error) {
        console.error('Error al obtener información de los equipos:', error);
      }
    },
    getWinner() {
      if (this.game.score_t1 !== 0) {
        if (this.game.score_t1 === this.game.score_t2) {
          this.winner = this.team1.name;
        } else {
          this.winner = this.game.score_t1 > this.game.score_t2 ? this.team1.name : this.team2.name;
        }
      }
    }
  },
  async mounted() {
    const userData = JSON.parse(sessionStorage.getItem('userData'));
    this.user = userData;
    if (userData && userData.user_type === "admin") {
      this.displayButtons = true;
    }
    await this.getTeamsInfo();
  }
};
</script>

<style></style>
