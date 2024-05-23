<template>
  <div class="home-header">
    <h5>El nostre esperit</h5>
    <p>
      Som una comunitat esportiva vibrant on els jugadors poden desenvolupar les
      seves habilitats, competir en tornejos i gaudir de l'esport amb diversió
      independentment del seu nivell.
    </p>
  </div>

  <div class="home-bar">
    <nav>
      <ul class="img-li">
        <li>
          <a href="../rutaInstalacions">
            <img src="../assets/instalacions.jpg" alt="instalacions" />
            <h3>Instal·lacions</h3>
          </a>
        </li>

        <li>
          <a href="../rutaClubs">
            <img src="../assets/clubs.jpg" alt="clubs" />
            <h3>Clubs</h3>
          </a>
        </li>
        <li>
          <a href="../rutaTornejos">
            <img src="../assets/tornejos.jpg" alt="tornejos" />
            <h3>Tornejos</h3>
          </a>
        </li>
      </ul>
    </nav>
  </div>

  <div class="classes">
    <h4>Classes amb els millors</h4>
    <div class=""></div>
  </div>

  <div class=""></div>
</template>

<script>
export default {
  name: "HomeComponent",
};
</script>

<style>
.home-header {
  width: 100%;
  height: 250px;
  background: linear-gradient(
    to top,
    rgba(249, 77, 123, 1),
    rgba(244, 90, 69, 0.5)
  );
}

.nav {
  background-color: rgb(224, 60, 49);
  padding: 5px;
}
.img-li {
  font-size: 25px;
  list-style: none;
  display: flex;
  justify-content: space-evenly;
}

img{
  width: 70%;
}

.classes{
  background-color: #F94D7B;
  width: 80%;
  height: 100px;
}
</style>
