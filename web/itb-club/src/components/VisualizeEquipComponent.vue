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
    <button v-if="playerIDs.length <= 4" class="button" @click="addMeToTeam()">Afegir-se</button>
  </div>
</template>

<script>
import axios from 'axios';
import IconLocation from "./icons/IconLocation.vue";
import JugadorComponent from "./JugadorComponent.vue";

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
      playersData:[],
    };
  },
  methods: {
    getTeamData() {
      axios.get('http://localhost/gestio_basquet/api/routes/teams/?id=' + this.id)
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
      axios.get('http://localhost/gestio_basquet/api/routes/locations/?id=' + this.team.location_id)
        .then(response => {
          if (response.data[0]) {
            this.clubName = response.data[0].name;
          } else {
            console.error('No se encontró el nombre del club');
          }
        })
    },
    getPlayersId() {
      this.playerIDs.push(this.team.captain, this.team.player1, this.team.player2, this.team.player3, this.team.player4);
      console.log(this.playerIDs);
    },
    addMeToTeam() {
      //acceder al session storage y hacer un post del nuevo usuario segun el num de ids
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
  padding: 1em;
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
</style>
