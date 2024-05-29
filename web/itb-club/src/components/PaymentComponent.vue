<template>
    <div class="payment-item">
        <div class="payment-info">
            <h3>Id pagament: {{ payment.id }}</h3>
            <p>Concepte: {{ payment.concept }}</p>
            <p>{{ payment.date }}</p>
        </div>
        <div class="payment-price">
            <p>{{ payment.quantity }}€</p>
        </div>

    </div>
</template>
<script>
export default {
    name: 'PaymentComponent',
    props: {
        payment: {
            payment: Object,
            required: true
        }
    },
};
</script>

<style scoped>

.payment-item {
    background-color: #4fccc1;
    padding: 1em;
    border-radius: 0.5em;
    display: flex;
    color: white;
    margin: 0.5em 0em;

}
.payment-item p{
    color: white;
    font-size: 1em;

}

.payment-info {
    width: 90%;
}

.payment-price {
    width: 10%;
    margin: auto;
    background-color: white;
    border-radius: 0.5em;

}
.payment-price p{
    color: #f94d7b;
    text-align: center;
    margin: auto;
    padding: 1em;

}
</style>