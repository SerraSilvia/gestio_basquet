// main.js
import { createApp } from 'vue';
import { createRouter, createWebHistory } from 'vue-router';
import App from './App.vue';
import axios from './axios';

import HomeComponent from './components/HomeComponent.vue';
import AboutComponent from './components/AboutComponent.vue';
import TornejosComponent from './components/TornejosComponent.vue';
import RankingsComponent from './components/RankingsComponent.vue';
import ReservesComponent from './components/ReservesComponent.vue';
import EquipsComponent from './components/EquipsComponent.vue';
import UsuariComponent from './components/UsuariComponent.vue';
import CrearEquipComponent from './components/CrearEquipComponent.vue';
import VisualizeEquipComponent from './components/VisualizeEquipComponent.vue';
import VisualizeTournamentComponent from './components/VisualizeTournamentComponent.vue';
import LoginComponent from './components/LoginComponent.vue';
import RegisterComponent from './components/RegisterComponent.vue';
import ReservaCrear from '@/components/ReservaCrear.vue';

const routes = [
  { path: '/', component: HomeComponent },
  { path: '/about', component: AboutComponent },
  { path: '/tornejos', component: TornejosComponent },
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
