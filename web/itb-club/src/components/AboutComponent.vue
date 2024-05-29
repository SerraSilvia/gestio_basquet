<template>
  <div class="who">
    <div class="content-parallelogram-big">
      <div class="parallelogram-big"></div>
      <div class="parallelogram-big"></div>
      <div class="parallelogram-big"></div>
      <div class="parallelogram-big"></div>
    </div>
    <div class="content">
      <h5>Qui som?</h5>
      <p>
        Som un club esportiu dedicat a fomentar la pràctica de l'esport i la
        competició en un entorn amigable i professional. Volem oferir bona
        experiència per als jugadors i al personal del club gestionant equips,
        tornejos i classes de manera eficient i senzilla.
      </p>
    </div>
    <div></div>
    <div></div>
  </div>

  <div class="subscription">
    <div class="subcription-parallelogram">
      <div></div>
      <div></div>
    </div>
    <div class="content-subscription">
      <h5>La nostra subscripció</h5>
      <p>
        Uneix-te a la nostra comunitat esportiva i gaudeix de tots els
        avantatges que oferim als nostres membres! Amb la subscripció al nostre
        club, tindràs accés a una àmplia gamma de serveis i activitats
        dissenyades per millorar la teva experiència esportiva.
      </p>
    </div>
  </div>

  <div class="where">
    <div class="content-parallelogram">
      <div class="parallelogram"></div>
      <div class="content-where">
        <h5>On ens pots trobar</h5>
      </div>
      <div class="map-container">
        <iframe
          src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d23927.090064496788!2d2.1659648000000002!3d41.4416896!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sca!2ses!4v1716362315269!5m2!1sca!2ses"
          width="300"
          height="300"
          style="border: 0"
          allowfullscreen=""
          loading="lazy"
          referrerpolicy="no-referrer-when-downgrade"
        ></iframe>
      </div>
    </div>
  </div>

  <div class="contact">
    <h5 class="title">Contacta'ns</h5>

    <div class="card">
      <div class="card-body">
        <p class="where-description">
          Ens trobem al cor de la ciutat per assegurar que els nostres membres
          tinguin fàcil accés a les nostres instal·lacions. Visita'ns a:
        </p>
        <p>Carrer de l'Esport, 123</p>
        <p>08080 Barcelona</p>
        <p>Catalunya, Espanya</p>
        <p>Telèfon: 938800000</p>
        <p>Email: ITBgym@itb.cat</p>

      </div>
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
  name: "AboutComponent",
};
</script>

<style scoped>
.who {
  position: relative;
  overflow: hidden;
  height: 600px;
  margin-bottom: 2rem;
}

.who .content {
  position: absolute;
  top: 4em;
  left: 0;
  margin-right: 60%;
  padding: 5px;
  color: white;
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
}

.parallelogram-big {
  width: 100%;
  height: 25em;
  transform-origin: center;
  transform: skew(-40deg) translate(40%, 20%);
  background: linear-gradient(
    to right,
    rgba(249, 77, 123, 1),
    rgba(244, 90, 69, 0.5)
  );
}
.content-parallelogram-big {
  position: relative;
}
.content-parallelogram-big div.parallelogram-big:nth-child(1) {
  height: 3em;
  transform-origin: center;
  transform: skew(-40deg) translate(50%, 150%);
}
.content-parallelogram-big div.parallelogram-big:nth-child(3) {
  height: 3em;
  transform-origin: center;
  transform: skew(-40deg) translate(30%, 180%);
}
.content-parallelogram-big div.parallelogram-big:nth-child(4) {
  width: 100%;
  height: 1em;
  transform-origin: center;
  transform: skew(-40deg) translate(28.7%, 574%);
}

.content-subscription {
  background-color: var(--color-quarter);
  padding: 6em 5em;
}

.content-subscription > p {
  padding-left: 4em;
  max-width: 40em;
}

.subcription-parallelogram {
  position: relative;
  width: 100%;
  height: 4em;
  padding: 0.5em 0;
}

.subcription-parallelogram div:nth-child(1) {
  background-color: var(--color-quarter);
  width: 90%;
  height: 3em;
  transform: skew(-40deg);
  position: absolute;
  left: -30px;
  top: 1.5em;
}

.subcription-parallelogram div:nth-child(2) {
  background-color: var(--color-quarter);
  width: 80%;
  height: 1em;
  transform: skew(-40deg);
  position: absolute;
  left: -30px;
  top: 0;
}

.content-parallelogram {
  display: flex;
  align-items: center;
  justify-content: space-between;
  width: 100%;
  height: 30em;
  position: relative;
}

.content-parallelogram > .parallelogram {
  width: 40% !important;
  height: 30em !important;
  background: #00a1e9;
  margin: 1em;
  margin-left: 200px !important;
  position: absolute !important;
  right: 20em;
  top: -60px;
}

.content-where {
  color: white;
  z-index: 1;
  font-size: 1.4rem;
  width: 100%;
  display: flex;
  justify-content: center;
  padding: 40px;
}

.map-container {
  border: 2px solid white;
  border-radius: 50%;
  overflow: hidden;
  width: 300px;
  height: 300px;
  position: absolute;
  left: calc(50% + 210px);
}

.map-container iframe {
  border-radius: 50%;
  width: 100%;
  height: 100%;
}

.contact {
  display: flex;
  justify-content: center;
  flex-direction: column;
  height: 300px;
  width: 100%;
  padding: 40px;
  box-sizing: border-box;
}
.contact .card {
  background: white;
  border: 2px solid white;
  border-radius: 25px;
  width: 100%;
  box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
}

.contact-us h5 {
  margin-left: -40px;
  padding-top: 50px;
}

.contact-us {
  margin-left: 200px;
}

.where-description {
  padding-bottom: 20px;
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

.card .card-body {
  padding: 10px 15px;
}
.card .card-body p {
  line-height: 1.5;
}
@media (max-width: 500px) {
  .parallelogram-big {
    transform: skew(-40deg) translate(80%, 20%);
  }
  .content-parallelogram-big div.parallelogram-big:nth-child(1) {
    transform: skew(-40deg) translate(123%, 150%);
  }
  .content-parallelogram-big div.parallelogram-big:nth-child(4) {
    transform: skew(-40deg) translate(24%, 574%);
  }

  .who .content {
    position: absolute;
    top: 4em;
    left: 0;
    margin-right: 20%;
    color: white;
    padding-left: 30px;
  }

  .content-subscription > p {
    padding-left: 0;
    max-width: 100%;
  }

  .content-parallelogram > .parallelogram {
    width: 100% !important;
    height: 90% !important;
    background: #00a1e9;
    right: -3em;
    top: 0;
  }

  .content-parallelogram > .parallelogram {
    top: 65px;
  }

  .content-where {
    color: white;
    z-index: 1;
    font-size: 1.4rem;
    width: 100%;
    display: flex;
    justify-content: center;
    padding: 40px;
    align-items: flex-start;
    height: 100%;
  }

  .map-container {
    position: absolute;
    top: calc(50% - 100px);
    left: calc(50% - 150px);
    margin-left: 0;
  }

  .where {
    height: 600px;
  }
}

h5,
p {
  color: black;
}

h5 {
  font-size: 1.8em;
  padding-bottom: 25px;
}

p {
  font-size: 1.2em;
}
</style>
