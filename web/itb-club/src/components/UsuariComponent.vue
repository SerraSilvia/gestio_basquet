<template>
    <p>Esta es la pagina del usuario</p>
    <div class="user-manager-container">
        <section>
            <h2>Les teves dades</h2>
        </section>

        <section>
            <h2>El teu equip</h2>
        </section>

        <section>
            <h2>Subscripcio</h2>
        </section>

        <section>
            <h2>Reserves</h2>
        </section>

    </div>

</template>
<script>
//habra que comprobar que el usuario es admin o que su id se corresponde con la id del session storage
export default {
    name: 'UsuariComponent'
};
</script>
<style></style>