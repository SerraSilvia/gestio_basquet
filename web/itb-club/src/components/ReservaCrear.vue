<template>
    <div>
        <h2>Confirmar Reserva</h2>
        <div v-if="date && slot">
            <p><strong>Fecha:</strong> {{ date }}</p>
            <p><strong>Franja horaria:</strong> {{ slot }}</p>
            <button @click="confirmarReserva">Confirmar Reserva</button>
        </div>
        <div v-else>
            <p>No hay ninguna reserva seleccionada.</p>
        </div>
    </div>
</template>

<script>
import axios from 'axios';

export default {
    name: 'ReservaCrear',
    data() {
        return {
            date: null,
            slot: null
        };
    },
    created() {
        this.date = this.$route.query.date;
        this.slot = this.$route.query.slot;
    },
    methods: {
        confirmarReserva() {
            axios.post('http://localhost/gestio_basquet/api/routes/bookings', {
                date: this.date,
                slot: this.slot,
                club_id: this.club_id
            })
            .then(response => {
                alert('¡Reserva confirmada!');
                this.$router.push('/');
            })
            .catch(error => {
                console.error('Error al confirmar la reserva:', error);
                alert('Error al confirmar la reserva. Inténtalo de nuevo.');
            });
        }
    }
};
</script>

<style>
div {
    text-align: center;
    margin-top: 50px;
}

button {
    padding: 10px 20px;
    background-color: #2196f3;
    color: white;
    border: none;
    cursor: pointer;
}

button:hover {
    background-color: #1976d2;
}
</style>
