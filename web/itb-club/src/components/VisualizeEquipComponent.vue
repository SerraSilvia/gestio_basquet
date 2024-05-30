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
      <JugadorComponent 
        v-for="(player, index) in playerIDs" 
        :key="index" 
        :player="player" 
        :is-admin="isAdmin" 
        @playerRemoved="getTeamData">
      </JugadorComponent>
    </section>

    <section>
      <h2>Puntuació</h2>
      <div>
        <p v-if="team && team.total_score">{{ team.total_score }}</p>
      </div>
    </section>
    <p v-if="message" :class="messageClass">{{ message }}</p>
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
      loged: false,
      isAdmin: false,
      message: null,
      messageClass: null
    };
  },
  methods: {
    async getTeamData() {
      try {
        const response = await axios.get(`http://apiitbclub-env.eba-jkyv4asm.us-east-1.elasticbeanstalk.com/teams/?id=${this.id}`);
        this.team = response.data[0];
        this.handleSelectedClub();
        this.getPlayersId();
      } catch (error) {
        console.error('Error al obtener datos del equipo:', error);
      }
    },
    async handleSelectedClub() {
      if (!this.team) return;
      try {
        const response = await axios.get(`http://apiitbclub-env.eba-jkyv4asm.us-east-1.elasticbeanstalk.com/locations/?id=${this.team.location_id}`);
        if (response.data[0]) {
          this.clubName = response.data[0].name;
        } else {
          console.error('No se encontró el nombre del club');
        }
      } catch (error) {
        console.error('Error al obtener el nombre del club:', error);
      }
    },
    getPlayersId() {
      this.playerIDs = [this.team.captain, this.team.player1, this.team.player2, this.team.player3, this.team.player4].filter(Boolean);
    },
    checkUserStatus() {
      const userData = JSON.parse(sessionStorage.getItem('userData'));
      if (userData) {
        this.loged = true;
        this.isAdmin = userData.user_type === 'admin';
      }
    },
    setMessage(text, success) {
      this.message = { text, success };
      this.messageClass = success ? 'success-message' : 'error-message';
    }
  },
  mounted() {
    this.checkUserStatus();
    this.getTeamData();
  }
};
</script>

<style scoped>
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

.success-message {
  color: green;
  font-weight: bold;
  text-align: center;
  margin-top: 20px;
}

.error-message {
  color: red;
  font-weight: bold;
  text-align: center;
  margin-top: 20px;
}
</style>

