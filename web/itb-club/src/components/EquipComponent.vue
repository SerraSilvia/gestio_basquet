<template>
    <section class="team"><!--Hacer que cuando se haga click se vaya a la pagina de equipo-->
        <div class="img-container">
            <img :src="img" alt="">
        </div>
        <div class="team-info">
            <h3>{{ nom }}</h3>
            <p>{{category}}</p>
        </div>
        <div class="score">
            <p >{{ total_score }}</p>
        </div>
        
    </section>
</template>

<script>
export default {
    name: 'EquipComponent',
    data() {
        return {//estos datos vendran del elemento padre, desde una propiedad "equipo"
            nom: "Mi equipo",
            category: "JUNIOR",
            total_score: 100,
            img: "https://upload.wikimedia.org/wikipedia/commons/a/a3/Image-not-found.png"
        }
    }
};
</script>

<style>
.team {
    background-color: #4fcdc4;
    width: 80%;
    margin: auto;
    border-radius: 1em;
    display: flex;
    justify-content: space-between;
}

.team:hover{
    box-shadow: 0.15em 0.15em #f94d7b;
}

.img-container img{
    margin: 0.5em;
    width: 3em;
    border-radius: 50%;
    box-shadow: 0.25em 0.25em #eff9f6;
}
.team-info{
 width: 80%;
padding: 1em 0em 0em 1em;
}
.score{
    font-weight: bolder;
    font-size: 1.1em;
    padding: 1.5em;
    color: aliceblue;

}

</style>