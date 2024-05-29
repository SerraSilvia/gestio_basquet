<template>
  <div class="player-container">
    <p>{{ playerData ? playerData.name : 'Vacant' }}</p>
    <div class="admin-teamates">
      <button 
        v-if="isAdmin && playerData" 
        class="button" 
        @click="deletePlayer"
      >
        Eliminar
      </button>
      <button 
        v-if="isAdmin && !playerData" 
        class="button" 
        @click="addPlayer"
      >
        Afegir
      </button>
    </div>
  </div>
</template>

<script>

export default {
  name: 'JugadorComponent',
  props: {
    player: {
      type: String,
      required: true
    }
  },
  data() {
    return {
      playerData: null,
      isAdmin: false
    }
  },
  methods: {
    getPlayerData() {
      this.$axios.get('/people/?id=' + this.player)
        .then(response => {
          this.playerData = response.data[0];
        })
        .catch(error => {
          console.error('Error al obtener datos del jugador:', error);
        });
    },
    deletePlayer() {
      // TODO: Implementar la lógica para eliminar el jugador del equip (retirar el id del equipo al jugador y del equipo)
      this.$axios.put('/people/?id=' + this.player)
        .then(response => {
          this.playerData = response.data[0];
        })
        .catch(error => {
          console.error('Error al obtener datos del jugador:', error);
        });
    },
    addPlayer() {
      // Implementar la lógica para añadir el jugador al equip
    }
  },
  mounted() {
    this.getPlayerData();
    const userLevel = localStorage.getItem('userLevel');
    this.isAdmin=true;
  }
};
</script>

<style>
.player-container {
  padding: 1em;
  border-radius: 1em;
  background-color: #eff9f6;
  margin: 0.25em 0em;
  display: flex;
  justify-content: space-between;
}
</style>
