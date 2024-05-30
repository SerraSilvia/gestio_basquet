<template>
  <RouterLink v-if="loged" :to="`/equips/${team.id}`">
    <section class="team">
      <div class="img-container">
        <img :src="teamImageSrc" alt="">
      </div>
      <div class="team-info">
        <h3>{{ team.name }}</h3>
        <p class="capitalize">{{ team.category }}</p>
      </div>
      <div class="score">
        <p>{{ team.total_score }}</p>
      </div>
    </section>
  </RouterLink>

  <section v-else class="team">
    <div class="img-container">
      <img :src="teamImageSrc" alt="">
    </div>
    <div class="team-info">
      <h3>{{ team.name }}</h3>
      <p class="capitalize">{{ team.category }}</p>
    </div>
    <div class="score">
      <p>{{ team.total_score }}</p>
    </div>
  </section>
</template>

<script>
import { RouterLink } from 'vue-router';

import defaultImage from '@/assets/images/team1.png'; // Verifica que la ruta sea correcta

const images = import.meta.glob('@/assets/images/*', { eager: true });

export default {
  name: 'EquipComponent',
  props: {
    team: {
      type: Object,
      required: true
    }
  },
  data() {
    return {
      loged: true
    };
  },
  computed: {
    teamImageSrc() {
      if (this.team && this.team.img) {
        const imagePath = `@/assets/images/${this.team.img}`;
        const image = Object.keys(images).find(img => img.includes(this.team.img));
        return image ? images[image].default : defaultImage;
      }
      return defaultImage;
    },
    defaultImage() {
      return defaultImage;
    }
  },
  mounted() {
    const userData = JSON.parse(sessionStorage.getItem('userData'));
    if (!userData) {
      this.loged = false;
    }
  }
};
</script>

<style scoped>
.team {
  background-color: #4fcdc4;
  width: 85%;    
  border-radius: 1em;
  display: flex;
  justify-content: space-between;
  margin: auto;
  margin-top: 2em;
}

.team:hover {
  box-shadow: 0.15em 0.15em #f94d7b;
}

.img-container img {
  margin: 0.5em;
  width: 3em;
  border-radius: 50%;
  box-shadow: 0.25em 0.25em #eff9f6;
}

.team-info {
  width: 80%;
  padding: 1em 0em 0em 1em;
}

.score {
  font-weight: bolder;
  font-size: 1.1em;
  padding: 1.5em;
  color: aliceblue;
}
</style>
