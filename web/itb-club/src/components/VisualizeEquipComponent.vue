<template>
  <div class="folder">
    <section>
      <h2>Informació d'equip</h2>
      <div class="info-equip">
        <img :src="teamImageSrc" alt="team_img" />
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
        :team-id="team.id" 
        :vacancy="getVacancy(index)" 
        @playerAdded="getTeamData">
      </JugadorComponent>
    </section>

    <section>
      <h2>Puntuació</h2>
      <div>
        <p v-if="team && team.total_score">{{ team.total_score }}</p>
      </div>
    </section>
    <button v-if="canJoinTeam" class="button" @click="addMeToTeam">Afegir-se</button>
    <p v-if="message" :class="messageClass">{{ message }}</p>
  </div>
</template>

<script>
import IconLocation from "./icons/IconLocation.vue";
import JugadorComponent from "./JugadorComponent.vue";
import axios from 'axios';

import defaultImage from '@/assets/images/team1.png'; 

const images = import.meta.glob('@/assets/images/*', { eager: true });

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
      isPlayer: false,
      hasTeam: false,
      message: null,
      messageClass: null
    };
  },
  computed: {
    canJoinTeam() {
      return this.loged && this.isPlayer && !this.hasTeam && this.playerIDs.length < 5;
    },
    teamImageSrc() {
      if (this.team && this.team.img) {
        const imagePath = `@/assets/images/${this.team.img}`;
        const image = Object.keys(images).find(img => img.includes(this.team.img));
        return image ? images[image].default : defaultImage;
      }
      return defaultImage;
    },
    defaultImage() {
      return defaultImage;
    }
  },
  methods: {
    getVacancy(index) {
      return `player${index + 1}`;
    },
    getTeamData() {
      axios.get(`http://apiitbclub-env.eba-jkyv4asm.us-east-1.elasticbeanstalk.com/teams/?id=${this.id}`)
        .then(response => {
          this.team = response.data[0];
          this.handleSelectedClub();
          this.getPlayersId();
        })
        .catch(error => {
          console.error('Error al obtener datos del equipo:', error);
        });
    },
    handleSelectedClub() {
      if (!this.team) return;
      axios.get(`http://apiitbclub-env.eba-jkyv4asm.us-east-1.elasticbeanstalk.com/locations/?id=${this.team.location_id}`)
        .then(response => {
          if (response.data[0]) {
            this.clubName = response.data[0].name;
          } else {
            console.error('No se encontró el nombre del club');
          }
        });
    },
    getPlayersId() {
      this.playerIDs = [this.team.captain, this.team.player1, this.team.player2, this.team.player3, this.team.player4].filter(Boolean);
    },
    addMeToTeam() {
      const userData = JSON.parse(sessionStorage.getItem('userData'));
      if (userData && userData.user_type === 'player' && userData.team_id === null) {
        const vacancyIndex = this.playerIDs.length;
        const vacancy = this.getVacancy(vacancyIndex);
        axios.put(`http://apiitbclub-env.eba-jkyv4asm.us-east-1.elasticbeanstalk.com/teams/?id=${this.team.id}&user_id=${userData.id}&player=${vacancy}`)
          .then(response => {
            if (response.data.status === 'success') {
              userData.team_id = this.team.id;
              sessionStorage.setItem('userData', JSON.stringify(userData));
              this.hasTeam = true;
              this.message = 'Te has unido al equipo con éxito.';
              this.messageClass = 'success-message';
              this.$router.push('/usuari');
            } else {
              this.message = 'Error al intentar unirse al equipo.';
              this.messageClass = 'error-message';
            }
          })
          .catch(error => {
            this.message = 'Error al intentar unirse al equipo.';
            this.messageClass = 'error-message';
            console.error('Error al intentar unirse al equipo:', error);
          });
      } else {
        this.message = 'No puedes unirte al equipo. Verifica tu estado de usuario.';
        this.messageClass = 'error-message';
      }
    },
    checkUserStatus() {
      const userData = JSON.parse(sessionStorage.getItem('userData'));
      if (userData) {
        this.loged = true;
        this.isPlayer = userData.user_type === 'player';
        this.hasTeam = userData.team_id !== null;
      }
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

.button {
  display: block;
  margin: 1em auto;
  padding: 10px 20px;
  background-color: #2196f3;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

.button:hover {
  background-color: #1976d2;
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
