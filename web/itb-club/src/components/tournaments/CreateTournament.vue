<template>
  <section id="create-tournament">
    <h2>Crear torneig</h2>
    <div id="crear-poligon"></div>
    <form id="form" @submit.prevent="createTournament">
      <label for="name">Nom</label>
      <input type="text" id="name" name="name" v-model="newTournament.name" />
      <small v-if="errors.name" class="form-error">{{ errors.name }}</small>

      <label for="location">Club</label>
      <select name="location" id="location" v-model="newTournament.location_id">
        <option value="1">Barcelona</option>
        <option value="2">Terrassa</option>
        <option value="3">Sabadell</option>
      </select>
      <small v-if="errors.location" class="form-error">{{ errors.location }}</small>

      <label for="date_start">Data d'inici</label>
      <input type="datetime-local" id="date_start" name="date_start" v-model="newTournament.date_start" required />

      <label for="date_end">Data de fi</label>
      <input type="datetime-local" id="date_end" name="date_end" v-model="newTournament.date_end" required />

      <input class="button" type="submit" value="Crear Torneig" />
    </form>
  </section>
</template>

<script>
export default {
  name: 'CreateTournament',
  data() {
    return {
      newTournament: {
        location_id: null,
        name: '',
        date_start: '',
        date_end: '',
        created_at: new Date().toISOString(),
        updated_at: new Date().toISOString(),
        deleted_at: null
      },
      errors: {}
    };
  },
  methods: {
    createTournament() {
      this.$axios.post('/tournaments/', this.newTournament)
        .then(response => {
          console.log("Torneo creado exitosamente", response.data);
          this.$router.push({ path: '/tournaments' });
        })
        .catch(error => {
          console.error("Error al crear el torneo", error);
          
        });
    }
  },
  mounted() {
    const userData = JSON.parse(sessionStorage.getItem('userData'));
    if (userData) {
      this.user = userData;
      if (this.user.user_type === "player" || this.user.user_type === "captain") {
        console.log("usuario no autorizado");
        this.$router.push({ path: '/' });
      }
    } else {
      this.$router.push({ path: '/login' });
    }
  }
};
</script>

<style scoped>
#create-tournament {
  padding: 0em 2em;
}

#create-tournament .user-manager-container {
  background-color: #eff9f6;
  margin: 5% 5%;
  padding: 1.25em 2em;
  border-radius: 1em;
  color: black;
}

#create-tournament .user-manager-container h3 {
  font-size: 1.25em;
  margin-bottom: 0.5em;
}

#create-tournament .user-manager-container section {
  margin: 1em 0em;
}

.flex {
  display: flex;
}

.center-container {
  padding: 0.5em 0em;
  display: flex;
  flex-direction: row;
  justify-content: space-around;
  align-items: center;
}

#user-info .white {
  padding: 0.5em;
  background-color: white;
  border-radius: 0.5em;
  margin-bottom: 1em;
}

#user-info p {
  padding: 0.5em;
}
</style>
