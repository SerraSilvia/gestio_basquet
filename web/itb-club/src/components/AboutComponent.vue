<template>
  <div class="quiSom">
    <div class="parallelogram-big"></div>
    <div class="content">
      <h5>Qui som?</h5>
      <p>
        Som un club esportiu dedicat a fomentar la pràctica de l'esport i la
        competició en un entorn amigable i professional. La nostra web està
        dissenyada per oferir bona experiència per als jugadors i al personal
        del club gestionant equips, tornejos i classes de manera eficient i
        senzilla.
      </p>
    </div>
  </div>

  <div class="subscripcio">
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

  <div class="onSom">
    <div class="content-parallelogram">
      <div class="parallelogram"></div>
      <div class="content">
        <h5>On ens pots trobar</h5>
        <p>
          Ens trobem al cor de la ciutat per assegurar que els nostres membres
          tinguin fàcil accés a les nostres instal·lacions. Visita'ns a:
        </p>
      </div>
    </div>
  </div>

  <div class="subscripcio">
    <div class="contacte">
      <h5>Contactan's</h5>
      <h5>Adreça:</h5>
      <p>Carrer de l'Esport, 123</p>
      <p>08080 Barcelona</p>
      <p>Catalunya, Espanya</p>
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

.quiSom {
  position: relative;
  overflow: hidden;
}

.content {
  position: absolute;
  top: 4em;
  left: 1.5em;
  padding: 5px;
  color: white;
  width: 35%;
  padding-left: 30px;
}
.content-parallelogram {
  position: relative;
  width: 100%;
  height: 30em;
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
    padding: .5em 0;
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
</style>
