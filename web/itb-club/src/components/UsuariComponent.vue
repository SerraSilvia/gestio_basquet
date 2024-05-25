<template>
  <div id="user-manager-page">
    <h2>Hola {{ user ? user.name : 'Usuari' }}</h2>
    <div class="user-manager-container">
      <section>
        <h3>Les teves dades</h3>
        <p>{{ user ? user.name : 'carregant...' }} {{ user ? user.surname : 'carregant...' }}</p>
        <p>{{ user ? user.mail : 'carregant...' }}</p>
        <p class="capitalize">{{ user ? user.player_level : 'carregant...' }}</p>
        <button class="button">Modificar</button>
      </section>

      <section v-if="user && user.level === 'player'">
        <h3>El teu equip</h3>
        <p v-if="team_id != null">
          <EquipComponent class="team-item" @selected-team="handleSelectedTeam" :team="team"></EquipComponent>
        </p>
        <p v-else>Sembla que no tens equip :(</p>
      </section>

      <section>
        <h3>Subscripció</h3>
        <PaymentComponent v-for="(payment, index) in payments" :key="index" :payment="payment"></PaymentComponent>
      </section>

      <section>
        <h3>Reserves</h3>
        <ReservaItemComponent v-for="(booking, index) in bookings" :key="index" :booking="booking">
        </ReservaItemComponent>
      </section>
      <button class="button" @click="logOut">Eliminar compte</button>
    </div>
  </div>
</template>

<script>
import EquipComponent from './EquipComponent.vue';
import ReservaItemComponent from './ReservaItemComponent.vue';
import PaymentComponent from './PaymentComponent.vue';

export default {
  name: 'UsuariComponent',
  data() {
    return {
      user: null,
      team_id: null,
      team: [],
      bookings: [],
      payments: [],
    };
  },
  components: {
    EquipComponent,
    ReservaItemComponent,
    PaymentComponent
  },
  methods: {
    handleSelectedTeam() {
      console.log("Se administran cosas");
    },
    getBookings() {
      console.log("Se consiguen reservas");
      this.$axios.get('bookings/?user_id=' + this.user.id)
        .then(response => {
          console.log("bookings: "+response.data);
          this.bookings = response.data;
        })
        .catch(error => {
          console.error('Error al intentar obtener las reservas', error);
        });
    },
    getPayments(){//falla la api
      this.$axios.get('payments/?user_id=' + this.user.id)
        .then(response => {
          console.log("payments: "+response.data);
          this.bookings = response.data;
        })
        .catch(error => {
          console.error('Error al intentar obtener las reservas', error);
        });
    },
    logOut() {
      sessionStorage.removeItem("userData");
      this.$router.push({ path: '/login' });
    }
  },
  mounted() {
    const userData = JSON.parse(sessionStorage.getItem('userData'));
    if (userData) {
      this.user = userData;
      this.getBookings();
      this.getPayments();
    } else {
      this.$router.push({ path: '/login' });
    }
  }
};
</script>

<style scoped>
#user-manager-page {
  padding: 0em 2em;
}

.user-manager-container {
  background-color: #eff9f6;
  margin: 0% 5%;
  padding: 0.5em 0.75em;
  border-radius: 1em;
  color: black;
}

.user-manager-container h3 {
  font-size: 1.25em;
  margin-bottom: 0.5em;
}

.user-manager-container section{
  margin: 1em 0em;
}
</style>
