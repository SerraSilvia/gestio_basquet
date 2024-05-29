<template>
  <div class="folder">
    <section>
      <h2>Informació d'equip</h2>
      <div class="info-equip">
        <img src="https://upload.wikimedia.org/wikipedia/commons/a/a3/Image-not-found.png" alt="" />
        <h3 class="team-name-big">{{ team ? team.name : '' }}</h3>
        <div class="location">
          <IconLocation></IconLocation>
          <p>{{ clubName }}</p>
        </div>
      </div>
    </section>

    <section class="section-players">
      <h2>Jugadors</h2>
      <JugadorComponent v-for="(player, index) in playerIDs" :key="index" :player="player"></JugadorComponent>
    </section>

    <section>
      <h2>Puntuació</h2>
      <div>
        <p v-if="team && team.total_score">{{ team.total_score }}</p>
      </div>
    </section>
    <div v-if="message" :class="{'success': message.success, 'error': !message.success}">
      {{ message.text }}
    </div>
    <button v-if="playerIDs.length <= 4" class="button" @click="addMeToTeam()">Afegir-se</button>
  </div>
</template>

<script>
import IconLocation from "./icons/IconLocation.vue";
import JugadorComponent from "./JugadorComponent.vue";
import axios from 'axios';

export default {
  name: "VisualizeEquipComponent",
  props: {
    id: {
      type: String,
      required: true,
    }
  },
  components: {
    IconLocation,
    JugadorComponent
  },
  data() {
    return {
      team: null,
      clubName: '',
      playerIDs: [],
      playersData: [],
      user: null,
      message: null
    };
  },
  methods: {
    getTeamData() {
      axios.get('http://apiitbclub-env.eba-jkyv4asm.us-east-1.elasticbeanstalk.com/teams/', { params: { id: this.id } })
        .then(response => {
          this.team = response.data[0];
          this.handleSelectedClub();
          this.getPlayersId();
        })
        .catch(error => {
          console.error('Error al obtener datos del equipo:', error);
          this.message = { text: 'Error al obtener datos del equipo', success: false };
        });
    },
    handleSelectedClub() {
      if (!this.team) return;
      axios.get('http://apiitbclub-env.eba-jkyv4asm.us-east-1.elasticbeanstalk.com/locations/', { params: { id: this.team.location_id } })
        .then(response => {
          if (response.data[0]) {
            this.clubName = response.data[0].name;
          } else {
            console.error('No se encontró el nombre del club');
            this.message = { text: 'No se encontró el nombre del club', success: false };
          }
        })
        .catch(error => {
          console.error('Error al obtener datos del club:', error);
          this.message = { text: 'Error al obtener datos del club', success: false };
        });
    },
    getPlayersId() {
      this.playerIDs = [];
      this.playerIDs.push(this.team.captain, this.team.player1, this.team.player2, this.team.player3, this.team.player4);
      console.log(this.playerIDs);
    },
    async addMeToTeam() {
      this.message = null;
      try {
        const storedUser = JSON.parse(sessionStorage.getItem('user'));
        if (!storedUser || storedUser.usertype !== 'player') {
          this.message = { text: 'No se encontró el usuario o no es un jugador', success: false };
          console.error('No se encontró el usuario o no es un jugador');
          return;
        }
        this.user = storedUser;

        const vacantPosition = ['captain', 'player1', 'player2', 'player3', 'player4'].find(position => !this.team[position]);
        if (!vacantPosition) {
          this.message = { text: 'No hay posiciones vacantes disponibles', success: false };
          console.error('No hay posiciones vacantes disponibles');
          return;
        }

        const response = await axios.put('http://apiitbclub-env.eba-jkyv4asm.us-east-1.elasticbeanstalk.com/teams/', null, {
          params: {
            id: this.id,
            user_id: this.user.id,
            player: vacantPosition
          }
        });

        if (response.data.status === 'success') {
          this.getTeamData();
          this.message = { text: 'Te has unido al equipo exitosamente', success: true };
          console.log('Te has unido al equipo exitosamente');
        } else {
          this.message = { text: 'Error al unirse al equipo', success: false };
          console.error('Error al unirse al equipo');
        }
      } catch (error) {
        this.message = { text: 'Error al unirse al equipo: ' + error.message, success: false };
        console.error('Error al unirse al equipo: ' + error.message);
      }
    }
  },
  mounted() {
    this.getTeamData();
  }
};
</script>

<style>
.folder {
  background-color: #4fccc1;
  padding: 1.5em;
  color: white;
  width: 75%;
  border-radius: 2em;
  margin: 2em auto;
}

.folder h2 {
  color: black;
}

.folder>div {
  background-color: aliceblue;
}

.folder .info-equip {
  color: black;
  text-align: center;
}

.info-equip h3 {
  padding: 1.25em;
  font-size: 1.25em;
}

section .info-equip {
  display: flex;
  justify-content: space-between;
}

.info-equip img {
  border-radius: 3em;
  width: 4em;
}

div .location {
  padding: 0.75em;
  justify-content: center;
}

.section-players {
  min-height: 12em;
}

.team-name-big {
  font-size: 6em;
}

.success {
  color: green;
}

.error {
  color: red;
}
</style>
