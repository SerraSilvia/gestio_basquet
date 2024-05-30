<template>
  <div class="reservation-summary">
    <h2>Resumen de reserva</h2>
    <p>Fecha de inicio: <span class="highlight">{{ formattedDateStart }}</span></p>
    <p>Fecha de fin: <span class="highlight">{{ formattedDateEnd }}</span></p>
    <p>ID de instalación: <span class="highlight">{{ facility_id }}</span></p>
    <p>ID de club: <span class="highlight">{{ club_id }}</span></p>
    <p>Estado de reserva: <span class="highlight">{{ reservation_status }}</span></p>
    <p>Tipo de reserva: <span class="highlight">{{ reservation_type }}</span></p>
    <p>ID de usuario logeado: <span class="highlight">{{ person_id }}</span></p>
    <button class="confirm-button" @click="confirmReservation">Confirmar Reserva</button>
    <p v-if="message" :class="messageClass">{{ message }}</p>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'ReservaCrear',
  data() {
    return {
      date_start: '',
      date_end: '',
      facility_id: '',
      club_id: '',
      reservation_status: 'confirmed',
      reservation_type: '',
      person_id: '',
      message: null,
      messageClass: null
    };
  },
  computed: {
    formattedDateStart() {
      return this.formatDate(this.date_start);
    },
    formattedDateEnd() {
      return this.formatDate(this.date_end);
    }
  },
  methods: {
    formatDate(date) {
      if (!date) return '';
      const d = new Date(date);
      const year = d.getFullYear();
      const month = ('0' + (d.getMonth() + 1)).slice(-2);
      const day = ('0' + d.getDate()).slice(-2);
      const hours = ('0' + d.getHours()).slice(-2);
      const minutes = ('0' + d.getMinutes()).slice(-2);
      const seconds = ('0' + d.getSeconds()).slice(-2);
      return `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`;
    },
    confirmReservation() {
      const bookingData = {
        facility_id: this.facility_id,
        person_id: this.person_id,
        date_start: this.formattedDateStart,
        date_end: this.formattedDateEnd,
        reservation_status: this.reservation_status,
        reservation_type: this.reservation_type,
      };
      console.log('Datos enviados a la API:', bookingData);
      this.$axios.post('bookings/', bookingData)
        .then(response => {
          this.message = 'Reserva confirmada con éxito!';
          this.messageClass = 'success-message';
          console.log('Reserva confirmada:', response.data);
          this.$router.push('/usuari'); // Redirigir a /usuari después de la reserva exitosa
        })
        .catch(error => {
          this.message = 'Error al confirmar la reserva.';
          this.messageClass = 'error-message';
          console.error('Error al confirmar la reserva:', error);
        });
    },
    loadQueryParams() {
      const query = this.$route.query;
      this.date_start = query.date_start || '';
      this.date_end = query.date_end || '';
      this.facility_id = query.facility_id || '';
      this.club_id = query.club_id || '';
      this.reservation_type = query.reservation_type || '';
      const userData = JSON.parse(sessionStorage.getItem("userData"));
      this.person_id = userData ? userData.id : '';
    }
  },
  mounted() {
    this.loadQueryParams();
  }
};
</script>

<style scoped>
.reservation-summary {
  max-width: 600px;
  margin: 0 auto;
  padding: 20px;
  background-color: #f9f9f9;
  border-radius: 8px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.reservation-summary h2 {
  text-align: center;
  margin-bottom: 20px;
}

.reservation-summary p {
  font-size: 16px;
  margin: 10px 0;
}

.reservation-summary .highlight {
  font-weight: bold;
  color: #333;
}

.confirm-button {
  display: block;
  width: 100%;
  padding: 10px;
  margin-top: 20px;
  background-color: #2196f3;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size: 16px;
  text-align: center;
}

.confirm-button:hover {
  background-color: #1976d2;
}

.success-message {
  color: green;
  font-weight: bold;
  text-align: center;
  margin-top: 20px;
}

.error-message {
  color: red;
  font-weight: bold;
  text-align: center;
  margin-top: 20px;
}
</style>
