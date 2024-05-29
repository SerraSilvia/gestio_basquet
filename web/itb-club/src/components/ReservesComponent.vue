<template>
  <div v-if="isLoggedIn">
    <section id="bookings">
      <h2>Selecciona el club</h2>
      <div>
        <ClubSelectComponent @selected-club="handleSelectedClub"></ClubSelectComponent>
      </div>
    </section>

    <section v-if="facilities.length">
      <h2>Pistas</h2>
      <div>
        <ul>
          <li v-for="facility in facilities" :key="facility.id" @click="selectFacility(facility)" :class="{ 'selected-facility': facility.id === selectedFacilityId }">
            {{ facility.name }}
          </li>
        </ul>
      </div>
    </section>

    <section>
      <h2>Horas disponibles:</h2>
      <div>
        <table>
          <thead>
            <tr>
              <th>Lun</th>
              <th>Mar</th>
              <th>Mié</th>
              <th>Jue</th>
              <th>Vie</th>
              <th id="weekend">Sab</th>
              <th id="weekend">Dom</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="week in calendar" :key="week[0].date">
              <td v-for="day in week" :key="day.date" :class="{'is-today': day.isToday, 'is-selected': day.isSelected, 'is-weekend': day.isWeekend}" @click="selectDate(day)">
                {{ day.date.getDate() }}
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </section>

    <section v-if="selectedDate">
      <h2>Seleccione una franja horaria para el {{ selectedDate.toLocaleDateString() }}:</h2>
      <div>
        <ul>
          <li v-for="slot in slots" :key="slot" :class="{'is-selected': slot === selectedSlot}" @click="selectSlot(slot)">
            {{ slot }}
          </li>
        </ul>
      </div>
    </section>

    <section>
      <h2>Selecciona el tipo de reserva</h2>
      <div>
        <label for="reservationType">Tipo de Reserva:</label>
        <select v-model="reservationType" @change="updateReservationLink" class="reservation-type-select">
          <option value="class">Class</option>
          <option value="training">Training</option>
        </select>
      </div>
    </section>

    <p class="button-container">
      <RouterLink :to="reservationLink" class="button" v-if="canReserve">Fer reserva!</RouterLink>
    </p>
  </div>
  <div v-else>
    <div class="card-info">
      <p>Por favor, inicia sesión para hacer una reserva.</p>
      <RouterLink to="/login" class="link">Ir a la página de inicio de sesión</RouterLink>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import ClubSelectComponent from './ClubSelectComponent.vue';

export default {
  name: 'ReservesComponent',
  data() {
    return {
      facilityName: 'Barcelona',
      facilities: [],
      club_id: 1,
      selectedDate: null,
      selectedSlot: null,
      selectedFacilityId: null,
      reservationType: 'class',
      calendar: [],
      slots: ['8:00h-10:00h', '10:00h-12:00h', '12:00h-14:00h', '17:00h-19:00h', '19:00h-21:00h', '21:00h-23:00h'],
      isLoggedIn: false
    };
  },
  components: {
    ClubSelectComponent
  },
  computed: {
    canReserve() {
      return this.selectedDate && this.selectedSlot && this.selectedFacilityId;
    },
    reservationLink() {
      if (this.canReserve) {
        const date_start = new Date(this.selectedDate);
        const [startHour, endHour] = this.selectedSlot.split('-');
        const startTime = startHour.split('h')[0] + ':00:00';
        const endTime = endHour.split('h')[0] + ':00:00';

        date_start.setHours(parseInt(startHour.split(':')[0]), 0, 0);

        const date_end = new Date(date_start);
        date_end.setHours(parseInt(endHour.split(':')[0]), 0, 0);

        const date_start_formatted = `${date_start.toISOString().split('T')[0]} ${startTime}`;
        const date_end_formatted = `${date_end.toISOString().split('T')[0]} ${endTime}`;

        return {
          path: '/reserva/crear',
          query: {
            date_start: date_start_formatted,
            date_end: date_end_formatted,
            facility_id: this.selectedFacilityId,
            club_id: this.club_id,
            reservation_type: this.reservationType
          }
        };
      }
      return '#';
    }
  },
  methods: {
    checkLoginStatus() {
      const userData = JSON.parse(sessionStorage.getItem("userData"));
      if (userData && userData.id) {
        this.isLoggedIn = true;
      } else {
        this.isLoggedIn = false;
      }
    },
    handleSelectedClub(selectedClub) {
      this.club_id = selectedClub;
      this.getFacilitiesByLocation(this.club_id);
      this.generateCalendar();
    },
    getFacilitiesByLocation(locationId) {
      axios.get(`http://apiitbclub-env.eba-jkyv4asm.us-east-1.elasticbeanstalk.com/facilities/?location_id=${locationId}`)
        .then(response => {
          this.facilities = response.data;
        })
        .catch(error => {
          console.error('Error al obtener las instalaciones:', error);
        });
    },
    generateCalendar() {
      const today = new Date();
      let start = new Date(today.getFullYear(), today.getMonth(), 1);
      let end = new Date(today.getFullYear(), today.getMonth() + 1, 0);

      if (today.getDate() > start.getDate() - 7) {
        start = new Date(today.getFullYear(), today.getMonth() + 1, 1);
        end = new Date(today.getFullYear(), today.getMonth() + 2, 0);
      }

      const startDate = start.getDay() === 1 ? start : new Date(start.setDate(start.getDate() - (start.getDay() - 1)));
      const endDate = end.getDay() === 5 ? end : new Date(end.setDate(end.getDate() + (5 - end.getDay())));

      let currentDate = new Date(startDate);
      const weeks = [];

      while (currentDate <= endDate) {
        const week = [];
        for (let i = 0; i < 7; i++) {
          week.push({
            date: new Date(currentDate),
            isToday: currentDate.toDateString() === today.toDateString(),
            isSelected: false,
            isWeekend: i >= 5,
            isWeekday: currentDate >= today 
          });
          currentDate.setDate(currentDate.getDate() + 1);
        }
        weeks.push(week);
      }

      this.calendar = weeks;
    },
    selectDate(day) {
      if (!day.isWeekday) return;
      this.calendar.forEach(week => {
        week.forEach(d => {
          d.isSelected = false;
        });
      });
      day.isSelected = true;
      this.selectedDate = day.date;
      this.selectedSlot = null;
    },
    selectSlot(slot) {
      this.selectedSlot = slot;
    },
    selectFacility(facility) {
      this.selectedFacilityId = facility.id;
    },
    updateReservationLink() {
      this.$forceUpdate();
    }
  },
  mounted() {
    this.checkLoginStatus();
    if (this.isLoggedIn) {
      this.generateCalendar();
    }
  }
};
</script>

<style scoped>
#bookings {
  padding-top: .5rem;
  padding-left: 1.5rem;
  padding-right: 1.5rem;
}
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

table {
  width: 100%;
  border-collapse: collapse;
}

th, td {
  border: 1px solid #ddd;
  padding: 8px;
  text-align: center;
  cursor: pointer;
}

th {
  background-color: #f2f2f2;
}

.is-today {
  background-color: #ffeb3b;
}

.is-selected {
  background-color: #2196f3;
  color: white;
}

.is-weekend {
  background-color: #ECE0BF; 
}

#weekend {
  background-color: #C5B484; 
}

ul {
  list-style: none;
  padding: 0;
}

li {
  cursor: pointer;
  padding: 10px;
  border: 1px solid #ddd;
  margin: 5px 0;
  text-align: center;
}

li.is-selected, .selected-facility {
  background-color: #2196f3;
  color: white;
}

.reservation-type-select {
  display: block;
  width: 100%;
  padding: 8px;
  margin-top: 8px;
  border: 1px solid #ddd;
  border-radius: 4px;
  background-color: white;
  transition: border-color 0.3s ease;
}

.reservation-type-select:focus {
  border-color: #2196f3;
  outline: none;
}
</style>
