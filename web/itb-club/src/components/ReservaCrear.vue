<template>
  <div>
    <h2>Resumen de reserva</h2>
    <p>Fecha de inicio: {{ date_start }}</p>
    <p>Fecha de fin: {{ date_end }}</p>
    <p>ID de instalación: {{ facility_id }}</p>
    <p>ID de club: {{ club_id }}</p>
    <p>Estado de reserva: {{ reservation_status }}</p>
    <p>Tipo de reserva: {{ reservation_type }}</p>
    <p>ID de usuario logeado: {{ person_id }}</p>
    <button @click="confirmReservation">Confirmar Reserva</button>
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
      slot: '',
      facility_id: '',
      club_id: '',
      reservation_status: 'confirmed', 
      reservation_type: '',
      person_id: '' 
    };
  },
  mounted() {
    const query = this.$route.query;
    this.date_start = this.formatDate(query.date);
    this.date_end = this.formatDateEnd(query.date);
    this.slot = query.slot || '';
    this.facility_id = query.facility_id || '';
    this.club_id = query.club_id || '';
    this.reservation_type = query.reservation_type || '';

    const userData = JSON.parse(sessionStorage.getItem('userData'));
    this.person_id = userData ? userData.id : '';
  },
  methods: {
    formatDate(date) {
      const formattedDate = new Date(date);
      return formattedDate.toLocaleString();
    },
    formatDateEnd(date) {
      const formattedDate = new Date(date);
      formattedDate.setHours(formattedDate.getHours() + 2); 
      return formattedDate.toLocaleString();
    },
    confirmReservation() {
      
      const bookingData = {
        facility_id: this.facility_id,
        person_id: this.person_id, 
        date_start: this.$route.query.date, 
        date_end: this.date_end, 
        reservation_status: this.reservation_status, 
        reservation_type: this.reservation_type 
      };

      
      axios.post('http://apiitbclub-env.eba-jkyv4asm.us-east-1.elasticbeanstalk.com/bookings', bookingData)
        .then(response => {
          console.log('Reserva creada:', response.data);
          
        })
        .catch(error => {
          console.error('Error al crear la reserva:', error);
          
        });
    }
  }
};
</script>

<style scoped>
/* Estilos si es necesario */
</style>