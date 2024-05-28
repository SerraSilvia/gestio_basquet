<template>
  <div id="user-manager-page">
    <div>
      <img :src="user ? user.img : ''" alt="user_img">
      <h2>Hola, {{ user ? user.name : 'Usuari' }}</h2>
    </div>
    
    <div class="user-manager-container">
      <section id="user-info">
        <h3>Les teves dades</h3>
        <div class="white">
          <p>{{ user ? user.name : 'carregant...' }} {{ user ? user.surnames : 'carregant...' }}</p>
          <p>{{ user ? user.mail : 'carregant...' }}</p>
          <p class="capitalize">{{ user ? user.player_level : 'carregant...' }}</p>
        </div>
        <div class="center-container">
            <button id="deleteAcount" class="button-pink" @click="deleteAcount">Eliminar compte</button>
            <button id="modifyAcount" class="button-pink" @click="modifyAcount">Modificar dades</button>
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

      <section v-if="user && bookings.size > 0">
        <h3>Reserves</h3>
        <ReservaItemComponent v-for="(booking, index) in bookings" :key="index" :booking="booking">
        </ReservaItemComponent>
      </section>

      <section v-if="user && user.level === 'player'">
        <h3>Comentaris</h3>
        <CommentComponent v-for="(comment, index) in comments" :key="index" :comment="comment">
        </CommentComponent>
      </section>

    </div>

  </div>
</template>

<script>
import EquipComponent from './EquipComponent.vue';
import ReservaItemComponent from './ReservaItemComponent.vue';
import PaymentComponent from './PaymentComponent.vue';
import CommentComponent from './CommentComponent.vue';


export default {
  name: 'UsuariComponent',
  data() {
    return {
      user: null,
      team: [],
      bookings: [],
      payments: [],
      comments: [],
    };
  },
  components: {
    EquipComponent,
    ReservaItemComponent,
    PaymentComponent,
    CommentComponent
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
      console.log("equipo id:" + this.user.team_id);
      this.$axios.get('teams/?id=' + this.user.team_id)
        .then(response => {
          console.log("equipo:"+ response.data[0]);
          this.team = response.data[0];
        })
        .catch(error => {
          console.error('Error al intentar obtener el equipo', error);
        });
    },
    getComments() {
      this.$axios.get('comments/?person_id=' + this.user.id)
        .then(response => {
          this.comments = response.data;
        })
        .catch(error => {
          console.error('Error al intentar obtener los comentarios', error);
        });
    },
    deleteAcount() {
      sessionStorage.removeItem("userData");
      this.$axios.delete('comments/?_id=' + this.user.id)
        .then(response => {
          this.comments = response.data;
        })
        .catch(error => {
          console.error('Error al intentar obtener los comentarios', error);
        });
      this.$router.push({ path: '/' });
    }, 
    modifyAcount(){
      console.log("se modifica el usuario");
      this.$router.push({ path: '/modify/user/${team.id}' });

    }
  },
  mounted() {
    const userData = JSON.parse(sessionStorage.getItem('userData'));
    if (userData) {
      this.user = userData;
      this.getBookings();
      this.getPayments();
      this.getComments();
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

#user-info .white{
  padding: 0.5em;
  background-color: white;
  border-radius: 0.5em;
  margin-bottom: 1em;
}

#user-info p{
  padding: 0.5em;

}
</style>
