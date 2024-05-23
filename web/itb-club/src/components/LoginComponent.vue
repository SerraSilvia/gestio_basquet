<template>
     <section>
        <h2>Log in</h2>
        <div id="crear-poligon"></div>
        <form id="form" @submit.prevent="validatorForm">

            <label for="email">Mail</label>
            <input type="email" id="email" name="email" v-model="email">
            <small v-if="errors.email" class="form-error">{{ errors.email }}</small>

            <label for="password">Contrasenya</label>
            <input type="password" id="password" name="password" v-model="password">
            <small v-if="errors.password" class="form-error">{{ errors.password }}</small>

            <input class="button" type="submit">
        </form>
    </section>
    <RouterLink to="/register">Registrar-se</RouterLink>

</template>
<script>
import { Validators } from '@/utils/validators.js';

export default {
    name:'LoginComponent',
    data() {
        return {
            errors: {},
            email: '',
            password: ''
        };
    },
    methods: {
        validatorForm() {
            this.resetForm();

            if (!Validators.required(this.email)) {
                this.errors.email = 'El correo electrónico es obligatorio.';
            } else if (!Validators.email(this.email)) {
                this.errors.email = 'El correo electrónico debe ser válido.';
            }

            if (!Validators.required(this.password)) this.errors.password = 'La contraseña es obligatoria.';

        },
        resetForm() {
            this.errors = {
                name: null,
                surnames: null,
                dni: null,
                location: null,
                category: null,
                email: null,
                password: null
            }
        }
    }
};
</script>