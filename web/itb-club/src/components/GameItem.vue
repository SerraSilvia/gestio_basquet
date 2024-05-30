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
      updatedGame:[] 
    };
  },
  methods: {
    async clickTeam1() {
      this.$emit("selected-winner", [1, this.game.team1_id, this.game.tournament_position]);
      this.displayButtons = false;
      window.location.reload();

      // Hacer update de la puntuación del juego
    },
    async clickTeam2() {
      this.$emit("selected-winner", [2, this.game.team2_id, this.game.tournament_position]);
      this.displayButtons = false;
      window.location.reload();

      // Hacer update de la puntuación del juego
    },
    async getTeamsInfo() {
      try {
        // Obtener información del equipo 1
        const response1 = await this.$axios.get(`teams/?id=${this.game.team1_id}`);
        this.team1 = response1.data[0];
        
        // Obtener información del equipo 2
        const response2 = await this.$axios.get(`teams/?id=${this.game.team2_id}`);
        this.team2 = response2.data[0];

        // Verificar si se muestran los botones o se determina al ganador
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
      if (this.game.score_t1 === this.game.score_t2) {
        // Si el puntaje es el mismo, el ganador será el equipo 1
        this.winner = this.team1.name;
      } else {
        // De lo contrario, determinar el ganador basado en los puntajes
        this.winner = this.game.score_t1 > this.game.score_t2 ? this.team1.name : this.team2.name;
      }
    }
  },
  async mounted() {
    const userData = JSON.parse(sessionStorage.getItem('userData'));
    this.user = userData;
    if (userData && userData.user_type == "admin") {
      this.displayButtons = true;
    }
    await this.getTeamsInfo();
  }
};
</script>

<style></style>
