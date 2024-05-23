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
import { axiosInstance } from '@/axios.js';

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
        async validatorForm() {
            this.resetForm();

            if (!Validators.required(this.email)) {
                this.errors.email = 'El correo electrónico es obligatorio.';
                return
            } else if (!Validators.email(this.email)) {
                this.errors.email = 'El correo electrónico debe ser válido.';
                return
            }

            if (!Validators.required(this.password)) {
                this.errors.password = 'La contraseña es obligatoria.';
                return
            }    

            try {
                const response = await axiosInstance.post('/auth/login', {
                    email: this.email,
                    password: this.password
                });
                
                sessionStorage.setItem('token', response.token);
                alert('Inicio de sesión exitoso');
            } catch (error) {
                console.error('Error:', error);
                this.errors.general = 'Error al iniciar sesión. Por favor, inténtelo de nuevo.';
            }
           

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