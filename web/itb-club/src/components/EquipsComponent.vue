<template>
    <section>
        <h2>Selecciona el club</h2>
            <div>
                <ClubSelectComponent></ClubSelectComponent>
            </div>
    </section>

    <section>
        <h2>Equips a Barcelona</h2>
        <div>
            <EquipComponent></EquipComponent>
        </div>
    </section>
    <RouterLink  class="button" to="/equips/crear">Crear Equip</RouterLink><!--falta hacer el componente de crear equipo-->
   
</template>
<script>
import EquipComponent from './EquipComponent.vue'
import ClubSelectComponent from './ClubSelectComponent.vue'
export default {
    name:'EquipsComponent',
    data() {
        return{
            equip:null,//esto se cojera de la connexion a la api
        };
    },
    components:{
        EquipComponent,
        ClubSelectComponent
    }

};
</script>

<style>

.button{
    margin-top:3em;
}

section{
    padding: 0% 7.5%;
}

</style>