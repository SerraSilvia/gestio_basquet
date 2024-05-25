<template>
    <p>Esto es un pago</p>
</template>
<script>
export default {
    name:'PaymentComponent',
    props: {
        team: {
            payment: Object,
            required: true
        }
    },
};
</script>