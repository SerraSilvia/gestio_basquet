<template>
  <div class="folder">
    <section>
      <h2>Informació d'equip</h2>
      <div class="info-equip">
        <img
          src="https://upload.wikimedia.org/wikipedia/commons/a/a3/Image-not-found.png"
          alt=""
        />
        <h3>Nom equip</h3>
        <div class="location">
          <IconLocation></IconLocation>
          <p>Barcelona</p>
        </div>
      </div>
    </section>

    <section>
        <h2>Jugadors</h2>
        <!--Aqui habra que poner un bucle con un componente por jugador-->
    </section>

    <section>
        <h2>Puntuació</h2>

    </section>
  </div>
</template>

<script>
import IconLocation from "./icons/IconLocation.vue";
//TODO: hacer conexion a la api y usar el id para obtener los datos del equipo y los jugadores
export default {
  name: "VisualizeEquipComponent",
  props: {
    id: {
      type: Number,
      required: true,
    },
  },
  components: {
    IconLocation,
  },
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
.folder > div {
  background-color: aliceblue;
}
.folder .info-equip {
  color: black;
  text-align: center
}
.info-equip h3{
    padding: 1.25em;
    font-size: 1.25em
}

section .info-equip{
    display: flex;
    justify-content:space-between;
}
.info-equip img{
    border-radius: 3em;
    width: 4em;
}
div .location{
   padding: 0.75em;
    justify-content: center;
}
</style>
