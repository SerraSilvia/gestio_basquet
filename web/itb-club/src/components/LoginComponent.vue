<template>
     <section>
        <h2>Log in</h2>
        <div id="crear-poligon"></div>
        <form action="POST">

            <label for="mail">Mail</label>
            <input type="email" id="mail" name="mail">

            <label for="password">Contrasenya</label>
            <input type="password" id="password" name="password">

            <input class="button" type="submit">
        </form>
    </section>
    <RouterLink to="/register">Registrar-se</RouterLink>

</template>
<script>
export default {
    name:'LoginComponent'
};
</script>