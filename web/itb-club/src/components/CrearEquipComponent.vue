<template>
    <section>
        <h2>Crea el teu equip</h2>
        <p class="info">En crear un equip seràs el capità i podras administrar el jugadors que s'uneixin al teu equip.</p>
        <form action="POST">
            <label for="name">Nom d'equip</label>
            <input type="text" id="name" name="name">

            <label for="location">Club</label>
            <select name="location" id="location">
                <option value="Barcelona">Barcelona</option>
                <option value="Terrassa">Terrassa</option>
                <option value="Sabadell">Sabadell</option>
            </select>

            <label for="category">Categoria</label>
            <select name="category" id="category">
                <option value="cadet">Cadet</option>
                <option value="junior">Junior</option>
                <option value="senior">Senior</option>
            </select>
            <input class="button" type="submit">
        </form>
    </section>
</template>

<script>
export default {
    name: 'CrearEquipComponent'
};
</script>

<style>
section {

}

form {
    max-width: 90%;
    margin: 2em;
    padding: 2em;
    background-color: #eff9f6;
    border-radius: 10px;
    display: flex;
    flex-direction: column;
}

label {
    margin-top: 10px;
    font-weight: bold;
}

input[type="text"],
select {
    margin-top: 5px;
    padding: 10px;
    border: 1px solid #00a1e9;
    border-radius: 5px;
    font-size: 16px;
}

input[type="text"]:focus,
select:focus {
    border-color: #00a1e9;
    outline: none;
}

input[type="submit"] {
    width: 6em;
    margin: auto;
    border-color: white;
    border-style: solid;
}

label {
    margin-top: 3em;
}

.dropdown-info {
    text-align: center;
    margin-bottom: 10px;
    color: #666;
    font-size: 14px;
}

#category {
    margin-bottom: 2em;
}
</style>
