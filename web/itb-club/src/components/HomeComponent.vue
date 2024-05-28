<template>
  <div class="home-header">
    <div class="header-content">
      <h5>El nostre esperit</h5>
      <p>
        Som una comunitat esportiva vibrant on els jugadors poden desenvolupar
        les seves habilitats, competir en tornejos i gaudir de l'esport amb
        diversió independentment del seu nivell.
      </p>
    </div>
  </div>

  <div class="home-bar">
    <nav>
      <ul class="img-li">
        <li class="home-li">
          <a href="../../facilitiesInfo.html">
            <div class="parallelogram-img">
              <img src="../assets/instalacions.jpg" alt="instalacions" />
            </div>
            <h3>Instal·lacions</h3>
          </a>
        </li>

        <li class="home-li">
          <a href="../rutaClubs">
            <div class="parallelogram-img">
              <img src="../assets/clubs.jpg" alt="clubs" />
            </div>
            <h3>Clubs</h3>
          </a>
        </li>
        <li class="home-li">
          <a href="../rutaTornejos">
            <div class="parallelogram-img">
              <img src="../assets/tornejos.jpg" alt="tornejos" />
            </div>
            <h3>Tornejos</h3>
          </a>
        </li>
      </ul>
    </nav>
  </div>

  <div class="classes">
    <h4>Classes amb els millors</h4>
    <div class="coach">
      <ul>
        <li>
          <img src="../assets/images/entrenador1.jpg" alt="entrenador1.jpg" />
          <h5>Robert Piera</h5>
        </li>

        <li>
          <img src="../assets/images/entrenador2.jpg" alt="entrenador2.jpg" />
          <h5>Francesc Vila</h5>
        </li>

        <li>
          <img src="../assets/images/entrenador3.jpg" alt="entrenador3.jpg" />
          <h5>Pep Salas</h5>
        </li>

        <li>
          <img src="../assets/images/entrenador4.jpg" alt="entrenador4.jpg" />
          <h5>Laia Soria</h5>
        </li>

        <li>
          <img src="../assets/images/entrenador5.jpeg" alt="entrenador5.jpeg" />
          <h5>Alberto Casas</h5>
        </li>

        <li>
          <img src="../assets/images/entrenador6.jpg" alt="entrenador6.jpg" />
          <h5>Daniel Artigas</h5>
        </li>
      </ul>
    </div>
  </div>

  <div class="leaders">
    <div class="leaders-info">
      <h4>Líders en competir</h4>
      <p>
        Al nostre club esportiu, ens enorgullim de ser líders en la competència.
        Organitzem tornejos de primer nivell i oferim programes de formació per
        ajudar els nostres jugadors a desenvolupar-se i assolir els seus
        objectius. Uneix-te a nosaltres i descobreix per què som els millors en
        competir!
      </p>
    </div>
    <div class="leaders-list">
      <ul>
        <li></li>
      </ul>
    </div>
  </div>

  <div class="booking-container">
    <div class="parallelogram"></div>
    <div class="booking">
      <h5>Reserva un camp</h5>
      <p>
        Per disfrutar del teu esport preferit al nostre club, reserva la teva
        pista amb antel·lació. Fes-ho fàcilment a través de la nostra plataforma
        en línia o posa't en contacte amb nosaltres. No deixis escapar
        l'oportunitat de practicar a les nostres instal·lacions!
      </p>
      <button>reserva</button>
    </div>
  </div>

  <nav class="footer">
    <ul>
      <li><i class="fa-brands fa-facebook"></i></li>
      <li><i class="fa-brands fa-instagram"></i></li>
      <li><i class="fa-brands fa-square-twitter"></i></li>
      <li><i class="fa-brands fa-youtube"></i></li>
    </ul>
  </nav>
</template>
<script>
export default {
  name: "HomeComponent",
};
</script>

<style scoped>
h3 {
  font-size: 40px !important;
  padding-top: 10px;
  text-decoration: none !important;
}

h4 {
  font-size: 30px !important;
  padding-top: 50px;
  padding-bottom: 20px;
  padding-left: 50px;
}

.home-header {
  width: 100%;
  height: 300px;
  background: linear-gradient(
    to top,
    rgba(249, 77, 123, 1),
    rgba(244, 90, 69, 0.5)
  );
}

.header-content {
  width: 45%;
  float: right;
  padding-top: 30px;
  padding-right: 20px;
}

.home-bar {
  display: flex;
  justify-content: space-evenly;
  padding-top: 60px;
}

.nav {
  background-color: rgb(224, 60, 49);
  padding: 20px;
}
.home-li {
  display: flex;
  justify-content: space-evenly;
  box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
  background-color: #00a1e9;
  border: 1px solid #00a1e9;
  transition: transform .25s;
}
.home-li:hover {
  transform: scale(105%);
}

.img-li {
  font-size: 25px;
  list-style: none;
  display: flex;
  justify-content: space-evenly;
  gap: 70px;
}

img {
  width: 100%;
  height: 300px;
}

.home-li h3 {
  color: black;
  text-align: center;
  font-size: 25px;
}

.classes {
  max-width: 100%;
  overflow: hidden;
  padding: 20px;
  box-sizing: border-box;
}
.coach {
  background: linear-gradient(to right, #a4ded9, #d4f6f4);
  width: 90%;
  height: 250px;
  border-radius: 10px;
  display: flex;
  justify-content: center;
  margin: 0 auto;
  box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
}
.coach ul {
  display: flex;
  justify-content: space-evenly;
  list-style-type: none;
  flex-wrap: wrap;
  gap: 40px;
  padding-top: 50px;
}

.coach li {
  display: flex;
  flex-direction: column;
  align-items: center;
  text-align: center;
}

.coach img {
  width: 150px;
  height: 150px;
  object-fit: cover;
  border-radius: 50%;
}
.leaders {
  background: linear-gradient(
    to bottom,
    rgba(249, 77, 123, 1),
    rgba(244, 90, 69, 0.5)
  );
  margin-top: 40px;
  width: 100%;
  height: 300px;
  padding-top: 40px;
}

.leaders-info {
  width: 40%;
  height: auto;
  float: left;
  padding-left: 30px;
}

.booking-container {
  max-width: 100%;
  padding-top: 20px;
  display: flex;
  justify-content: space-around;
}

.booking {
  width: 40%;
  height: auto;
  float: right;
  padding-left: 30px;
}
.parallelogram {
    width: 10em;
    height: 7em;
    transform: skew(-20deg);
    background: #00a1e9;
    margin: 1em;
    position: relative;
}

.parallelogram:hover{
    background: rgb(249,77,123);
    background: linear-gradient(16deg, rgba(249,77,123,1) 0%, rgba(0,161,233,1) 82%);
}
.parallelogram{
  width: 20% !important;
  height: 400px !important;
  
}
.button {
  float: right;
}
.footer {
  position: relative;
  display: flex;
  justify-content: space-around;
  align-items: center;
}

.footer ul {
  list-style: none;
  display: flex;
}

.footer ul > li {
  padding: 0 10px;
}
</style>
