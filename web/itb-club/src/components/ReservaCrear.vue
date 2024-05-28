<template>
  <div>
    <h2>Resumen de reserva</h2>
    <p>Fecha de inicio: {{ formattedDateStart }}</p>
    <p>Fecha de fin: {{ formattedDateEnd }}</p>
    <p>ID de instalación: {{ facility_id }}</p>
    <p>ID de club: {{ club_id }}</p>
    <p>Estado de reserva: {{ reservation_status }}</p>
    <p>Tipo de reserva: {{ reservation_type }}</p>
    <p>ID de usuario logeado: {{ person_id }}</p>
    <button @click="confirmReservation">Confirmar Reserva</button>
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
      axios.post('http://apiitbclub-env.eba-jkyv4asm.us-east-1.elasticbeanstalk.com/bookings/', bookingData)
        .then(response => {
          this.message = 'Reserva confirmada con éxito!';
          this.messageClass = 'success-message';
          console.log('Reserva confirmada:', response.data);
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
.success-message {
  color: green;
}

.error-message {
  color: red;
}
</style>
