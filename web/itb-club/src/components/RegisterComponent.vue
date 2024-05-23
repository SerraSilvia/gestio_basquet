<template>
    <section id="register">
        <h2>Registrar-se</h2>
        <div id="crear-poligon"></div>
        <form id="form" @submit.prevent="validatorForm">

            <label for="name">Nom</label>
            <input type="text" id="name" name="name" v-model="name">
            <small v-if="errors.name" class="form-error">{{ errors.name }}</small>

            <label for="name">Surnames</label>
            <input type="text" id="surnames" name="surnames" v-model="surnames">
            <small v-if="errors.surnames" class="form-error">{{ errors.surnames }}</small>

            <label for="name">DNI</label><!--TODO: hacer que valide con js antes de enviar el formulario-->
            <input type="text" id="dni" name="dni" v-model="dni">
            <small v-if="errors.dni" class="form-error">{{ errors.dni }}</small>

            <label for="location">Club</label>
            <select name="location" id="location" v-model="location">
                <option value="Barcelona">Barcelona</option>
                <option value="Terrassa">Terrassa</option>
                <option value="Sabadell">Sabadell</option>
            </select>
            <small v-if="errors.location" class="form-error">{{ errors.location }}</small>

            <label for="category">Categoria</label>
            <select name="category" id="category" v-model="category">
                <option value="cadet">Cadet</option>
                <option value="junior">Junior</option>
                <option value="senior">Senior</option>
            </select>
            <small v-if="errors.category" class="form-error">{{ errors.category }}</small>

            <label for="mail">Email</label>
            <input type="email" id="mail" name="mail" v-model="email">
            <small v-if="errors.email" class="form-error">{{ errors.email }}</small>

            <label for="password">Contrasenya</label>
            <input type="password" id="password" name="password" v-model="password">
            <small v-if="errors.password" class="form-error">{{ errors.password }}</small>

            <input class="button" type="submit">
        </form>
    </section>
    <RouterLink to="/login">Logar-se</RouterLink>

</template>
<script>
import { Validators } from '@/utils/validators.js';

export default {
    name: 'RegisterComponent',
    data() {
        return {
            errors: {},
            name: '',
            surnames: '',
            dni: '',
            location: null,
            category: null,
            email: '',
            password: ''
        };
    },
    methods: {
        validatorForm() {
            this.resetForm();

            if (!Validators.required(this.name)) this.errors.name = 'El nombre es obligatorio.';
            if (!Validators.required(this.surnames)) this.errors.surnames = 'Los apellidos son obligatorios.';
            if (!Validators.required(this.dni)) this.errors.dni = 'El DNI es obligatorio.';
            if (!Validators.required(this.location)) this.errors.location = 'La ubicación es obligatoria.';
            if (!Validators.required(this.category)) this.errors.category = 'La categoría es obligatoria.';

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

<style>
.form-error {
    color: red;
}
</style>