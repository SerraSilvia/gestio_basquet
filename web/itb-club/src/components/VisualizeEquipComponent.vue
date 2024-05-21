<template>
    <p>Esta es la página de visualizar un equipo con detalles</p>
    <p>{{ id }}</p>
</template>

<script>
export default {
    name: 'VisualizeEquipComponent',
    props: {
        id: {
            type: Number,
            required: true
        }
    }
};
</script>
