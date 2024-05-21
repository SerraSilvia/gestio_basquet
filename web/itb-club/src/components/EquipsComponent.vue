<template>
    <section>
        <h2>Selecciona el club</h2>
        <div>
            <ClubSelectComponent @selected-club="handleSelectedClub"></ClubSelectComponent>
        </div>
    </section>

    <section>
        <h2>Equips a {{club}}</h2>
        <div>
            <EquipComponent selected-club="handleSelectedClub"></EquipComponent>
        </div>
    </section>
    <p class="button-container">
        <RouterLink class="button" to="/equips/crear">Crear Equip</RouterLink>
        <!-- falta hacer el componente de crear equipo -->
    </p>
</template>

<script>
import EquipComponent from './EquipComponent.vue'
import ClubSelectComponent from './ClubSelectComponent.vue'
export default {
    name: 'EquipsComponent',
    data() {
        return {
            equip: null, // esto se cojera de la conexion a la API
            club: "Barcelona",
        };
    },
    components: {
        EquipComponent,
        ClubSelectComponent
    },
    methods:{
        handleSelectedClub(selectedClub){
            this.club=selectedClub;//no funciona
            console.log(this.club)
        }
    }
};
</script>

<style>
.button-container {
    display: flex;
    justify-content: center;
    margin: 20px 0;
}

.button {
    transition: background-color 0.3s ease;
}

section {
    padding: 0 7.5%;
}
</style>
