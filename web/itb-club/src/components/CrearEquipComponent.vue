<template>
  <section>
    <h2>Crea el teu equip</h2>
    <div id="crear-poligon"></div>
    <p class="info">
      En crear un equip seràs el capità i podras administrar el jugadors que
      s'uneixin al teu equip.
    </p>
    <form id="form" @submit.prevent="validatorForm">
      <label for="name">Nom d'equip</label>
      <input type="text" id="name" name="name" v-model="newTeam.name" />
      <small v-if="errors.name" class="form-error">{{ errors.name }}</small>

      <label for="location">Club</label>
      <select name="location" id="location" v-model="newTeam.location">
        <option value="Barcelona">Barcelona</option>
        <option value="Terrassa">Terrassa</option>
        <option value="Sabadell">Sabadell</option>
      </select>
      <small v-if="errors.location" class="form-error">{{
        errors.location
      }}</small>

      <label for="category">Categoria</label>
      <select name="category" id="category" v-model="newTeam.category">
        <option value="cadet">Cadet</option>
        <option value="junior">Junior</option>
        <option value="senior">Senior</option>
      </select>
      <small v-if="errors.category" class="form-error">{{
        errors.category
      }}</small>

      <input class="button" type="submit" />
    </form>
  </section>
</template>

<script>
import { Validators } from '@/utils/validators';
export default {
  name: "CrearEquipComponent",
  data() {
    return {
      errors: {},
      newTeam: {
        name: "",
        location_id: 1,
        category: "",
        img: "image.png",
        captain: 0,
      },
    };
  },
  mounted() {
    this.setCaptainId();
  },
  methods: {
    validatorForm() {
      this.resetForm();

      if (!Validators.required(this.newTeam.name)) {
        this.errors.name = "El nombre es obligatorio.";
        return;
      }
      if (!Validators.required(this.newTeam.location_id)) {
        this.errors.location = "La ubicación es obligatoria.";
        return;
      }
      if (!Validators.required(this.newTeam.category)) {
        this.errors.category = "La categoría es obligatoria.";
        return;
      }

      this.addTeam();
    },
    resetForm() {
      this.errors = {
        name: null,
        location_id: null,
        category: null,
        img: null,
        captain: JSON.parse(sessionStorage.getItem("userData")).id,
      };
    },
    setCaptainId() {
      const user = JSON.parse(sessionStorage.getItem("userData"));
      if (user) {
        this.newTeam.captain = user.id;
      } else {
        console.error('No user ID found in session storage');
      }
    },
    addTeam() {
      console.log("Creando un nuevo equipo...");
      this.$axios.post('teams/', this.newTeam)
        .then(response => {
          console.log('Equipo ha sido agregado:', response.data);
        })
        .catch((error) => {
          console.error("Error al agregar el equipo:", error);
        });
    },

  },
};
</script>

<style scoped>
section {
  padding-top: 1em;
}

form {
  max-width: 90%;
  margin: 5em 2em;
  padding: 2em;
  background-color: #eff9f6;
  border-radius: 10px;
  display: flex;
  flex-direction: column;
}

label {
  margin-top: 1em;
  font-weight: bold;
}

input[type="text"],
input[type="email"],
input[type="password"],
select {
  margin-top: 5px;
  padding: 10px;
  border: 1px solid #00a1e9;
  border-radius: 5px;
  font-size: 16px;
}

input[type="text"]:focus,
input[type="email"]:focus,
input[type="password"]:focus,
select:focus {
  border-color: #00a1e9;
  outline: none;
}

input[type="submit"] {
  width: 6em;
  margin: auto;
  border-color: white;
  border-style: solid;
}

label {
  margin-top: 3em;
}

.dropdown-info {
  text-align: center;
  margin-bottom: 10px;
  color: #666;
  font-size: 14px;
}

#crear-poligon {
  width: 40em;
  height: 9em;
  transform: skew(20deg);
  background: linear-gradient(
    to right,
    rgb(54, 208, 255),
    rgba(255, 159, 147, 0)
  );
  margin: 1em;
  position: absolute;
  top: 5em;
  left: 7em;
  z-index: -1;
}
</style>
