<template>
  <div>
    <h2>Confirmar Reserva</h2>
    <div v-if="date && slot && facilityName && clubName">
      <p><strong>Club:</strong> {{ clubName }}</p>
      <p><strong>Pista:</strong> {{ facilityName }}</p>
      <p><strong>Fecha:</strong> {{ date }}</p>
      <p><strong>Franja horaria:</strong> {{ slot }}</p>
      <button @click="confirmarReserva">Reservar Pista</button>
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
      slot: null,
      facility_id: null,
      facilityName: null,
      club_id: null,
      clubName: null,
      person_id: 1, // Este ID puede ser dinámico según la lógica de tu aplicación
      reservation_status: 'confirmed', // Ejemplo de estado de reserva
      reservation_type: 'typeA' // Ejemplo de tipo de reserva
    };
  },
  created() {
    this.date = this.$route.query.date;
    this.slot = this.$route.query.slot;
    this.facility_id = this.$route.query.facility_id;
    this.club_id = this.$route.query.club_id;

    if (this.date && this.slot && this.facility_id && this.club_id) {
      this.getFacilityName();
      this.getClubName();
    }
  },
  methods: {
    confirmarReserva() {
      const dateStart = new Date(`${this.date}T${this.slot.split('-')[0]}`);
      const dateEnd = new Date(`${this.date}T${this.slot.split('-')[1]}`);
      
      axios.post('http://localhost/gestio_basquet/api/routes/bookings', {
        facility_id: this.facility_id,
        person_id: this.person_id,
        date_start: dateStart.toISOString(),
        date_end: dateEnd.toISOString(),
        reservation_status: this.reservation_status,
        reservation_type: this.reservation_type
      })
      .then(response => {
        alert('¡Reserva confirmada!');
        this.$router.push('/');
      })
      .catch(error => {
        console.error('Error al confirmar la reserva:', error);
        alert('Error al confirmar la reserva. Inténtalo de nuevo.');
      });
    },
    getFacilityName() {
      axios.get(`http://apiitbclub-env.eba-jkyv4asm.us-east-1.elasticbeanstalk.com/facilities/${this.facility_id}`)
        .then(response => {
          this.facilityName = response.data.name;
        })
        .catch(error => {
          console.error('Error al obtener el nombre de la pista:', error);
        });
    },
    getClubName() {
      axios.get(`http://apiitbclub-env.eba-jkyv4asm.us-east-1.elasticbeanstalk.com/clubs/${this.club_id}`)
        .then(response => {
          this.clubName = response.data.name;
        })
        .catch(error => {
          console.error('Error al obtener el nombre del club:', error);
        });
    }
  }
};
</script>

<style scoped>
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