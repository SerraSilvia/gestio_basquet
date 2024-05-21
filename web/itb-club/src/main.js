import { createApp } from 'vue';
import { createRouter, createWebHistory } from 'vue-router';
import App from './App.vue';

import HomeComponent from './components/HomeComponent.vue';
import AboutComponent from './components/AboutComponent.vue';
import TornejosComponent from './components/TornejosComponent.vue';
import RankingsComponent from './components/RankingsComponent.vue';
import ReservesComponent from './components/ReservesComponent.vue';
import EquipsComponent from './components/EquipsComponent.vue';
import UsuariComponent from './components/UsuariComponent.vue';
import CrearEquipComponent from './components/CrearEquipComponent.vue';
import VisualizeEquipComponent from './components/VisualizeEquipComponent.vue';
import LoginComponent from './components/LoginComponent.vue';
import RegisterComponent from './components/RegisterComponent.vue';


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
    props: route => ({ id: Number(route.params.id) })
  },
  { path: '/login', component: LoginComponent },
  { path: '/register', component: RegisterComponent }
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

const app = createApp(App);

app.use(router);

app.mount('#app');
