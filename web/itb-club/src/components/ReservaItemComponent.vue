<template>
    <div class="reserva-item">
        <div class="reserva-left">
            <h3>Reserva ID: {{ booking.id }}</h3>
            <p>Instalació: {{ facility ? facility.name : 'carregant...' }}, {{ club ? club.name : 'carregant...' }}</p>
            <p>Dia: {{ date }}</p>
            <p>Inici: {{ startTime }}</p>
            <p>Final: {{ endTime }}</p>
        </div>

        <div class="reserva-right">
            <p class="capitalize">{{ booking.reservation_status }}</p>
            <p class="capitalize">{{ booking.reservation_type }}</p>
            <button v-if="booking.reservation_status != 'cancelled'" class="button"
                @click="deleteBooking">Cancelar</button>
        </div>
    </div>
</template>

<script>
export default {
    name: 'ReservaItemComponent',
    props: {
        booking: {
            type: Object,
            required: true
        }
    },
    data() {
        return {
            facility: null,
            club: null,
        }
    },
    computed: {
        date() {
            return this.booking.date_start.split(' ')[0];
        },
        startTime() {
            return this.booking.date_start.split(' ')[1];
        },
        endTime() {
            return this.booking.date_end.split(' ')[1];
        }
    },
    methods: {
        getFacility() {
            this.$axios.get('facilities/?id=' + this.booking.facility_id)
                .then(response => {
                    console.log("facility: " + response.data[0]);
                    this.facility = response.data[0];
                    this.getClub();
                })
                .catch(error => {
                    console.error('Error al intentar obtener la instalacion', error);
                });
        },
        getClub() {
            console.log(this.facility.location_id)
            this.$axios.get('locations/?id=' + this.facility.location_id)
                .then(response => {
                    console.log("club: " + response.data[0]);
                    this.club = response.data[0];
                })
                .catch(error => {
                    console.error('Error al intentar obtener el club', error);
                });
        }
    },
    mounted() {
        this.getFacility();
    }
}
</script>

<style scoped>
.reserva-item {
    background-color: #4fccc1;
    padding: 1em;
    border-radius: 0.5em;
    display: flex;
    color: white;
    margin: 0.5em 0em;
}

.reserva-left {
    width: 80%;
}

.reserva-right {
    width: 20%;
    margin: auto;
    text-align: center;
}

p {
    font-size: 1em;
    color: white;

}
h3{
    margin-bottom: 0.5em;
}
</style>