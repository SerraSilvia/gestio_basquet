<template>
    <section class="club-container">
        <div class="club-item" @click="clickClub('Barcelona')">
            <div class="parallelogram"></div>
            <p class="city-name">Barcelona</p>
        </div>
        <div class="club-item" @click="clickClub('Terrassa')">
            <div class="parallelogram"></div>
            <p class="city-name">Terrassa</p>
        </div>
        <div class="club-item" @click="clickClub('Sabadell')">
            <div class="parallelogram"></div>
            <p class="city-name">Sabadell</p>
        </div>
    </section>
</template>

<script>
export default {
    name: 'ClubSelectedComponent',
    data(){
        return{
            city:null
        };
    },
    methods: {
        clickClub(selectedCity) {
            this.city = selectedCity;
            this.$emit("selected-club", this.city);
        }
    }
};
</script>

<style>
.club-container {
    display: flex;
    justify-content: space-evenly;
    flex-wrap: wrap;
}
.club-item {
    display: flex;
    flex-direction: column;
    align-items: center;
    cursor: pointer;
}
.parallelogram {
    width: 10em;
    height: 7em;
    transform: skew(20deg);
    background: #00a1e9;
    margin: 1em;
    position: relative;

}

.parallelogram:hover{
    background: rgb(249,77,123);
    background: linear-gradient(16deg, rgba(249,77,123,1) 0%, rgba(0,161,233,1) 82%);
}

.city-name {
    margin-top: 0.15em;
    position: absolute;
    font-weight: bold;
    font-size: 1.25em;
}
</style>
