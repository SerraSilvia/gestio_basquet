<template>
    <section>
        <h2>Selecciona el club</h2>
        <div>
            <ClubSelectComponent @selected-club="handleSelectedClub"></ClubSelectComponent>
        </div>
    </section>

    <section>
        <h2>Pistes</h2>
        <div>
            // 
        </div>
    </section>

    <section>
        <h2>Hores disponibles:</h2>
        <div>
            //Add calendar
            <input type="date" name="date_start"><br>
            <input type="date" name="date_start"><br>
            <input type="date" name="date_start"><br>
        </div>
    </section>

    <p class="button-container">
        <RouterLink class="button" to="/reserva/crear">Fer reserva!</RouterLink>
    </p>
</template>

<script>
import axios from 'axios'; 
import ClubSelectComponent from './ClubSelectComponent.vue';

export default {
    name: 'ReservesComponent',
    data() {
        return {
            facilityName: "Barcelona",
            facilities: [],
            facility_id: 1, // Añadir club_id
        };
    },
    components: {
        ClubSelectComponent
    },
    methods: {
        handleSelectedClub(selectedClub) {
            this.club_id = selectedClub;
            axios.get('http://localhost/gestio_basquet/api/routes/locations/?id=' + this.club_id)
                .then(response => {
                    this.clubName = response.data[0].name;
                    this.getFacilities();
                })
        }
    },
    mounted() {
        this.getFacilities(); 
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
