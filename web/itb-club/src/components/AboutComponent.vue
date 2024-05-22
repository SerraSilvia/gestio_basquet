<template>
  <div class="who">
    <div class="parallelogram-big"></div>
    <div class="content">
      <h5>Qui som?</h5>
      <p>
        Som un club esportiu dedicat a fomentar la pràctica de l'esport i la
        competició en un entorn amigable i professional. Volem oferir bona experiència 
        per als jugadors i al personal del club gestionant equips, tornejos i classes 
        de manera eficient i senzilla.
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
      <p class="where-description">
        Ens trobem al cor de la ciutat per assegurar que els nostres membres
        tinguin fàcil accés a les nostres instal·lacions. Visita'ns a:
      </p>
      <p>Carrer de l'Esport, 123</p>
      <p>08080 Barcelona</p>
      <p>Catalunya, Espanya</p>
    </div>
    <div class="map-container">
      <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d23927.090064496788!2d2.1659648000000002!3d41.4416896!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sca!2ses!4v1716362315269!5m2!1sca!2ses" width="300" height="300" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
    </div>
  </div>
</div>


  <div class="contact">
  <div class="contact-us">
    <h5>Contacta'ns</h5>
    <p>Telèfon: 938800000</p>
    <p>ITBgym@itb.cat</p>
  </div>
</div>

</template>

<script>
export default {
  name: "AboutComponent",
};
</script>

<style>
:root {
    --color-quarter: #4fccc1;
}

.who {
  position: relative;
  overflow: hidden;
  height: 600px;
  margin-left: 40px;
}

.content {
  position: absolute;
  top: 4em;
  left: 1.5em;
  padding: 5px;
  color: white;
  width: 30%;
  padding-left: 30px;
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

.parallelogram-big {
  width: 100%;
  height: 30em;
  transform: skew(-40deg);
  margin: 1em;
  margin-left: 500px;
  background: linear-gradient(
    to right,
    rgba(249, 77, 123, 1),
    rgba(244, 90, 69, 0.5)
  );
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

.contact {
  background: white;
  height: 300px;
  width: 80%;
  margin-left: 100px;
  border: 2px solid white;
  border-radius: 25px;
}

.contact-us h5 {
  margin-left: -40px;
  padding-top: 50px;
}

.contact-us {
  margin-left: 200px;
}

.map-container {
  display: flex;
  align-items: center;
  justify-content: center;
  border: 2px solid white;
  border-radius: 50%;
  overflow: hidden;
  width: 300px;
  height: 300px;
  margin-left:100px;
}

.map-container iframe {
  border-radius: 50%;
  width: 100%;
  height: 100%;
}

.where-description{
padding-bottom:20px ;
}

.content-where {
  position: absolute;
  top: 4em;
  left: 600px;
  padding: 5px;
  color: white;
  width: 30%;
  padding-left: 30px;
}

</style>
