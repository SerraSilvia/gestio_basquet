// main.js
import { createApp } from 'vue';
import { createRouter, createWebHistory } from 'vue-router';
import App from './App.vue';
import axios from './axios';
import './styles.css';

import HomeComponent from './components/HomeComponent.vue';
import AboutComponent from './components/AboutComponent.vue';
import ViewTournaments from './components/tournaments/ViewTournaments.vue';
import RankingsComponent from './components/RankingsComponent.vue';
import ReservesComponent from './components/ReservesComponent.vue';
import EquipsComponent from './components/EquipsComponent.vue';
import UsuariComponent from './components/UsuariComponent.vue';

import CrearEquipComponent from './components/CrearEquipComponent.vue';
import VisualizeEquipComponent from './components/VisualizeEquipComponent.vue';
import VisualizeTournamentComponent from './components/tournaments/VisualizeTournamentComponent.vue';
import LoginComponent from './components/LoginComponent.vue';
import RegisterComponent from './components/RegisterComponent.vue';
import ReservaCrear from './components/ReservaCrear.vue';
import AdministrarComponent from './components/AdministrarComponent.vue';
import ModifyUserComponent from './components/ModifyUserComponent.vue';
import AdminUsers from './components/AdminUsers.vue';
import CreateNewUser from './components/CreateNewUser.vue';
import AdminComments from './components/AdminComments.vue';

import FacilitiesInfo from './components/FacilitiesInfo.vue';
import ClubsInfo from './components/ClubsInfo.vue';
import TournamentsInfo from './components/TournamentsInfo.vue';

import CreateTournament from './components/tournaments/CreateTournament.vue';
import ModifyTournament from './components/tournaments/ModifyTournament.vue';




const routes = [
  { path: '/', component: HomeComponent },
  { path: '/about', component: AboutComponent },
  { path: '/tornejos', component: ViewTournaments },
  { path: '/rankings', component: RankingsComponent },
  { path: '/reserva', component: ReservesComponent },
  { path: '/equips', component: EquipsComponent },
  { path: '/usuari', component: UsuariComponent },
  { path: '/equips/crear', component: CrearEquipComponent },
  {
    path: '/equips/:id',
    component: VisualizeEquipComponent,
    props: route => ({ id: String(route.params.id) })
  },
  { path: '/login', component: LoginComponent },
  { path: '/register', component: RegisterComponent },
  {
    path: '/tornejos/:id',
    component: VisualizeTournamentComponent,
    props: route => ({ id: String(route.params.id) })
  },
  {
    path: '/reserva/crear',
    component: ReservaCrear
  },
  {
    path: '/modify/user/:id',
    component: ModifyUserComponent,
    props: route => ({ id: String(route.params.id) })
  },
  {
    path: '/administrar/users',
    component: AdminUsers
  }, {
    path: '/administrar/users/add',
    component: CreateNewUser
  },
  {
    path: '/administrar',
    component: AdministrarComponent
  }, 
  {
    path: '/info-facilities',
    component: FacilitiesInfo
  }, {
    path: '/info-clubs',
    component: ClubsInfo
  }, {
    path: '/info-tornejos',
    component: TournamentsInfo
  }, {
    path: '/administrar/comments/:id',
    component: AdminComments,
    props: route => ({ id: String(route.params.id) })
  }, {
    path: '/tornejos/crear',
    component: CreateTournament
  }, {
    path: '/tornejos/modificar/:id',
    component: ModifyTournament,
    props: route => ({ id: String(route.params.id) })
  }
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

const app = createApp(App);

// Proporciona Axios globalmente
app.config.globalProperties.$axios = axios;

app.use(router);

app.mount('#app');
