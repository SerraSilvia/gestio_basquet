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

    <p class="button-container">
        <RouterLink class="button" :to="reservationLink">Fer reserva!</RouterLink>
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
            club_id: 1, 
            selectedDate: null,
            selectedSlot: null,
            calendar: [],
            slots: ['8:00h-10:00h', '10:00h-12:00h', '12:00h-14:00h', '17:00h-19:00h', '19:00h-21:00h', '21:00h-23:00h']
        };
    },
    components: {
        ClubSelectComponent
    },
    computed: {
        reservationLink() {
            if (this.selectedDate && this.selectedSlot) {
                return {
                    path: '/reserva/crear',
                    query: { 
                        date: this.selectedDate.toISOString().split('T')[0],
                        slot: this.selectedSlot
                    }
                };
            }
            return '#'; 
        }
    },
    methods: {
        handleSelectedClub(selectedClub) {
            this.club_id = selectedClub;
            axios.get('http://localhost/gestio_basquet/api/routes/locations/?id=' + this.club_id)
                .then(response => {
                    this.clubName = response.data[0].name;
                    this.getFacilities();
                });
        },
        getFacilities() {
            
        },
        generateCalendar() {
            const today = new Date();
            const start = new Date(today.getFullYear(), today.getMonth(), 1);
            const end = new Date(today.getFullYear(), today.getMonth() + 1, 0);

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
                        isWeekday: currentDate.getDay() >= 1 && currentDate.getDay() <= 5
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
        }
    },
    mounted() {
        this.getFacilities();
        this.generateCalendar();
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

li.is-selected {
    background-color: #2196f3;
    color: white;
}
</style>