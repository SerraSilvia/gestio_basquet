<template>
  <div>
    <h2>Confirmar Reserva</h2>
    <div v-if="date && slot && facilityName && clubName">
      <p><strong>Club:</strong> {{ clubName }}</p>
      <p><strong>Pista:</strong> {{ facilityName }}</p>
      <p><strong>Fecha:</strong> {{ date }}</p>
      <p><strong>Franja horaria:</strong> {{ slot }}</p>
      <button @click="confirmarReserva">Reservar Pista</button>
      <p v-if="successMessage" class="success-message">{{ successMessage }}</p>
      <p v-if="errorMessage" class="error-message">{{ errorMessage }}</p>
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
      person_id: 1, // Suponiendo que este ID se obtiene dinámicamente en tu aplicación
      reservation_status: 'confirmed', // Suponiendo que este estado se obtiene dinámicamente en tu aplicación
      reservation_type: 'typeA', // Suponiendo que este tipo se obtiene dinámicamente en tu aplicación
      successMessage: '',
      errorMessage: ''
    };
  },
  created() {
    this.date = this.$route.query.date;
    this.slot = this.$route.query.slot;
    this.facility_id = this.$route.query.facility_id;
    this.club_id = this.$route.query.club_id;

    if (this.date && this.slot && this.facility_id && this.club_id) {
      this.fetchFacilityName();
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
        if (response.data.status === 'success') {
          this.successMessage = 'Reserva realizada con éxito';
          this.errorMessage = '';
        } else {
          this.errorMessage = 'Error al realizar la reserva';
          this.successMessage = '';
        }
      })
      .catch(error => {
        console.error('Error al confirmar la reserva:', error);
        this.errorMessage = 'Error al realizar la reserva. Inténtalo de nuevo.';
        this.successMessage = '';
      });
    },
    fetchFacilityName() {
      axios.get(`http://localhost/gestio_basquet/api/routes/facilities/?id=${this.facility_id}`)
        .then(response => {
          if (response.data.length > 0) {
            const facility = response.data[0];
            this.facilityName = facility.name;
            this.fetchClubName(facility.location_id);
          } else {
            console.error('No se encontró la instalación.');
            this.errorMessage = 'No se encontró la instalación.';
          }
        })
        .catch(error => {
          console.error('Error al obtener el nombre de la pista:', error);
          this.errorMessage = 'Error al obtener el nombre de la pista.';
        });
    },
    fetchClubName(location_id) {
      axios.get(`http://localhost/gestio_basquet/api/routes/locations/?id=${location_id}`)
        .then(response => {
          if (response.data.length > 0) {
            const club = response.data[0];
            this.clubName = club.name;
          } else {
            console.error('No se encontró la ubicación.');
            this.errorMessage = 'No se encontró la ubicación.';
          }
        })
        .catch(error => {
          console.error('Error al obtener el nombre del club:', error);
          this.errorMessage = 'Error al obtener el nombre del club.';
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

.success-message {
  color: green;
  margin-top: 20px;
}

.error-message {
  color: red;
  margin-top: 20px;
}
</style>
