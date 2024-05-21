<template>
    <div class="quiSom">
        <div class="parallelogram"></div>
            <div class="content">
                <h5>Qui som?</h5>
                <p>Som un club esportiu dedicat a fomentar la pràctica de l'esport i la competició
                en un entorn amigable i professional. La nostra web està dissenyada per
                oferir bona experiència per als jugadors i al personal del club gestionant equips,
                tornejos i classes de manera eficient i senzilla.</p>
             </div>
    </div>
</template>
<script>
export default {
    name:'AboutComponent'
};
</script>

<style>

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
.parallelogram {
    width: 100%;
    height: 30em;
    transform: skew(-40deg);
    margin: 1em;
    margin-left:500px;
    background: linear-gradient(to right, rgba(249, 77, 123, 1), rgba(244, 90, 69, 0.5));
}

h5, p{
color:black;
}

h5{
font-size: 1.8em;
padding-bottom: 25px;
}

p{
font-size: 1.2em;
}
</style>