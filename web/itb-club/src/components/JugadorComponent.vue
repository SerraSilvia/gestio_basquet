<template>
  <div class="player-container">
    <p class="player-name">{{ playerData ? playerData.name : 'Vacant' }}</p>
    <div class="admin-teamates" v-if="isAdmin && playerData">
      <button class="button" @click="deletePlayer">Eliminar</button>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'JugadorComponent',
  props: {
    player: {
      type: String,
      required: true
    },
    teamId: {
      type: String,
      required: true
    },
    isAdmin: {
      type: Boolean,
      required: true
    }
  },
  data() {
    return {
      playerData: null,
    }
  },
  methods: {
    getPlayerData() {
      if (this.player !== 'Vacant') {
        axios.get(`http://apiitbclub-env.eba-jkyv4asm.us-east-1.elasticbeanstalk.com/people/?id=${this.player}`)
          .then(response => {
            this.playerData = response.data[0];
          })
          .catch(error => {
            console.error('Error al obtener datos del jugador:', error);
          });
      }
    },
    deletePlayer() {
      axios.put(`http://apiitbclub-env.eba-jkyv4asm.us-east-1.elasticbeanstalk.com/people/?id=${this.player}`, { team_id: null })
        .then(response => {
          if (response.data.status === 'success') {
            this.$emit('playerRemoved');
          } else {
            alert('Error al eliminar el jugador del equipo.');
          }
        })
        .catch(error => {
          alert('Error al eliminar el jugador del equipo.');
          console.error('Error al eliminar el jugador del equipo:', error);
        });
    }
  },
  mounted() {
    this.getPlayerData();
  }
};
</script>

<style scoped>
.player-container {
  padding: 1em;
  border-radius: 1em;
  background-color: #eff9f6;
  margin: 0.25em 0em;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.player-name {
  font-size: 1.2em;
  font-weight: bold;
  color: #333;
}

.admin-teamates {
  margin-left: auto;
}

.button {
  background-color: #f94d7b;
  color: white;
  border: none;
  border-radius: 5px;
  padding: 0.5em 1em;
  cursor: pointer;
  font-size: 0.9em;
}

.button:hover {
  background-color: #d43f6a;
}
</style>
