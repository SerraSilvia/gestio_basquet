<template>
  <div id="user-manager-page">
    <h2>Hola, {{ user ? user.name : 'Usuari' }}</h2>
    <div class="user-manager-container">
      <section>
        <h3>Les teves dades</h3>
        <p>{{ user ? user.name : 'carregant...' }} {{ user ? user.surname : 'carregant...' }}</p>
        <p>{{ user ? user.mail : 'carregant...' }}</p>
        <p class="capitalize">{{ user ? user.player_level : 'carregant...' }}</p>
        <div class="center-container">
          <button id="deleteAcount" class="button-pink" @click="deleteAcount">Eliminar compte</button>
          <button id="modifyAcount" class="button-pink">Modificar dades</button>
        </div>
      </section>

      <section v-if="user && user.level === 'player'">
        <h3>El teu equip</h3>
        <p v-if="user.team_id != null">
          <EquipComponent class="center-container team-item" :team="team"></EquipComponent>
        </p>
        <p v-else>Sembla que no tens equip :(</p>
      </section>

      <section v-if="user && user.level === 'player'">
        <h3>Subscripció</h3>
        <PaymentComponent v-for="(payment, index) in payments" :key="index" :payment="payment"></PaymentComponent>
      </section>

      <section>
        <h3>Reserves</h3>
        <ReservaItemComponent v-for="(booking, index) in bookings" :key="index" :booking="booking">
        </ReservaItemComponent>
      </section>

      <section v-if="user && user.level === 'player'">
        <h3>Comentaris</h3>
        <ComentariComponent v-for="(comment, index) in comments" :key="index" :comment="comment">
        </ComentariComponent>
      </section>

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
      comments:[],
    };
  },
  components: {
    EquipComponent,
    ReservaItemComponent,
    PaymentComponent
  },
  methods: {

    getBookings() {
      this.$axios.get('bookings/?user_id=' + this.user.id)
        .then(response => {
          this.bookings = response.data;
        })
        .catch(error => {
          console.error('Error al intentar obtener las reservas', error);
        });
    },
    getPayments() {
      this.$axios.get('payments/?user_id=' + this.user.id)
        .then(response => {
          this.payments = response.data;
        })
        .catch(error => {
          console.error('Error al intentar obtener las reservas', error);
        });
    },
    getTeam() {
      this.$axios.get('teams/?id=' + this.user.team_id)
        .then(response => {
          this.team = response.data[0];
        })
        .catch(error => {
          console.error('Error al intentar obtener el equipo', error);
        });
    },
    deleteAcount() {
      sessionStorage.removeItem("userData");
      //TODO: aqui se debera eliminar el usuario con la api
      this.$router.push({ path: '/' });
    }
  },
  mounted() {
    const userData = JSON.parse(sessionStorage.getItem('userData'));
    if (userData) {
      this.user = userData;
      this.getBookings();
      this.getPayments();
      if (this.user.team_id != null) this.getTeam();
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
  margin: 5% 5%;
  padding: 1.25em 0.75em;
  border-radius: 1em;
  color: black;

}

.user-manager-container h3 {
  font-size: 1.25em;
  margin-bottom: 0.5em;
}

.user-manager-container section {
  margin: 1em 0em;
}

.flex {
  display: flex;
}

.center-container {
  padding: 0.5em 0em;
  display: flex;
  flex-direction: row;
  justify-content: space-around;
  align-items: center;
}
</style>
