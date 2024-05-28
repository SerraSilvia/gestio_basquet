<template>
    <div class="container">
        <div class="user-img">
            <p>img</p>
        </div>
        <div class="user-info">
            <h3>{{ user.email }}</h3>
            <p>{{ user.id }}</p>
            <p class="capitalize">{{ user.user_type }}</p>
            
        </div>
        <div class="button-container">
                <button id="deleteAcount" class="button-pink" @click="deleteAcount">Eliminar</button>
                <button id="modifyAcount" class="button-pink" @click="modifyAcount">Modificar</button>
        </div>
    </div>
</template>

<script>

export default {
    name: 'userItemComponent.vue',
    props: {
        user: {
            type: Object,
            required: true
        }

    },
    methods: {
        deleteAcount() {
            if (this.user && this.user.id) {
                this.$axios.delete(`people/?id=${this.user.id}`)
                    .then(response => {
                        console.log('Cuenta eliminada');
                        this.$router.push({ path: '/administrar/users' });
                        window.location.reload();
                    })
                    .catch(error => {
                        console.error('Error al intentar eliminar la cuenta', error);
                    });
            }
        },
        modifyAcount() {
            if (this.user && this.user.id) {
                console.log("se modifica el usuario");
                this.$router.push({ path: `/modify/user/${this.user.id}` });
            }
        }
    }

};

</script>

<style scoped>
.container {
    display: flex;
    background-color: #4fccc1;
    border-radius: 1em;
    padding: 0.5em;
    flex-wrap: wrap;
    justify-content: space-between;
    margin-bottom: 0.5em;
}

.user-img{
    width: 5em;
}

.user-info{
    width: 30em;
}
.button-container{
    width: 6em;
    display: flex;
    flex-direction: column;
}
.button-container button{
    margin-bottom: 0.25em;
}
</style>