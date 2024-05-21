<template>
   <RouterLink :to="`/equips/${id}`"><!--TODO: crear componente y arreglar la ruta-->
        <section class="team">
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
    </RouterLink>

</template>

<script>
import { RouterLink } from 'vue-router';

export default {
    name: 'EquipComponent',
    data() {
        return {
            id: 1,
            nom: "Mi equipo",
            category: "JUNIOR",
            total_score: 100,
            img: "https://upload.wikimedia.org/wikipedia/commons/a/a3/Image-not-found.png"
        };
    },
    components: { RouterLink }
};
</script>

<style>
.team {
    background-color: #4fcdc4;
    width: 80%;
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