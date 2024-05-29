<template>
  <div class="info-facilities">
    <div class="title-poligon"></div>
    <h3>Les nostres instal·lacions</h3>
    <ul class="facilities-ul">
      <li>
        <img src="../assets/images/pistaInterior.jpg" alt="pistaInterior.jpg" />
        <h5>Pista interior</h5>
        <p class="desc">
          La pista interior compta equip d'alta qualitat. Conté amb grades, ideal per
          l'assistència de públic. Aquest espai és ideal tant per a entrenaments
          com per a partits casuals i tornejos.
        </p>
        <p><strong>Preu: </strong>20,00 € / hora</p>
      </li>
      <li>
        <img src="../assets/images/pistaExterior.jpg" alt="pistaExterior.jpg" />
        <h5>Pista exterior</h5>
        <p class="desc">
          La pista exterior compta amb il·luminació nocturna, permetent el seu ús en
          horaris estesos. Aquest espai és ideal tant per a entrenaments com per
          a partits casuals i tornejos.
        </p>
        <p><strong>Preu: </strong>20,00 € / hora</p>
      </li>
      <li>
        <img
          src="../assets/images/pistaEntrenament.jpg"
          alt="pistaEntrenament.jpg"
        />
        <h5>Pista d'entrenaments</h5>
        <p class="desc">
          La pista d'entrenaments està dissenyada per a sessions d'entrenament individuals o en
          grup. Amb una superfície antilliscant i de gran durabilitat, assegura les
          condicions òptimes per a l'exercici físic. Està equipada amb diverses
          zones funcionals i material d'entrenament de qualitat.
        </p>
        <p><strong>Preu: </strong>20,00 € / hora</p>
      </li>
      <li>
        <img src="../assets/images/pistaVip.jpg" alt="pistaVip.jpg" />
        <h5>Pista VIP</h5>
        <p class="desc">
          La pista VIP és una instal·lació d'alta gamma dissenyada per oferir
          una experiència esportiva exclusiva i equipada amb equipament
          d'última generació. Inclou serveis adicionals com seients
          confortables, refrescos, tovalloles i vestuaris privats.
        </p>
        <p><strong>Preu: </strong>60,00 € / hora</p>
      </li>
    </ul>
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
  name: "FacilitiesInfo",
};
</script>

<style scoped>

h3{
    font-size: 30px;
    padding-top: 5px ;
    margin-left: 20px;
}
h5{
    font-size: 30px !important;
    padding-top: 20px;
}
p{
    font-size: 20px;
}

.facilities-ul {
  background: linear-gradient(to right, #a4ded9, #d4f6f4);
  width: 90%;
  height: auto;
  border-radius: 10px;
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  grid-gap: 20px;
  margin: 0 auto;
  padding: 20px;
  box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
  margin-top: 90px;
}

.facilities-ul li {
  list-style: none;
  background: white;
  border-radius: 10px;
  padding: 15px;
  display: flex;
  flex-direction: column;
  align-items: center;
  text-align: center;
}

.facilities-ul img {
  width: 100%;
  height: 400px;
  border-radius: 10px;
  box-shadow: rgba(0, 0, 0, 0.15) 0px 2px 8px;
}

.facilities-ul h5 {
  margin: 10px 0;
  font-size: 1.2em;
  color: #333;
}

.facilities-ul p {
  margin: 5px 0;
  color: #666;
}
.desc{
    width: 100%;
    height: 100px;
}
.footer {
  position: relative;
  display: flex;
  justify-content: space-around;
  align-items: center;
  padding-top: 30px;
  padding-bottom: 20px;
}

.footer ul {
  list-style: none;
  display: flex;
}

.footer ul>li {
  padding: 0 10px;
}
</style>
