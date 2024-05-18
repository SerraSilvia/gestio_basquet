class Person {
    constructor(id, name, surnames, dni, email, password, birthdate, user_type, player_level, team_id) {
        this.id = id;
        this.name = name;
        this.surnames = surnames;
        this.dni = dni;
        this.email = email;
        this.password = password;
        this.birthdate = birthdate;
        this.user_type = user_type;
        this.player_level = player_level;
        this.team_id = team_id;
    }

    getId() {
        return this.id;
    }

    setId(id) {
        this.id = id;
    }

    getName() {
        return this.name;
    }

    setName(name) {
        this.name = name;
    }

    getSurnames() {
        return this.surnames;
    }

    setSurnames(surnames) {
        this.surnames = surnames;
    }

    getDni() {
        return this.dni;
    }

    setDni(dni) {
        this.dni = dni;
    }

    getEmail() {
        return this.email;
    }

    setEmail(email) {
        this.email = email;
    }

    getPassword() {
        return this.password;
    }

    setPassword(password) {
        this.password = password;
    }

    getBirthdate() {
        return this.birthdate;
    }

    setBirthdate(birthdate) {
        this.birthdate = birthdate;
    }

    getUserType() {
        return this.user_type;
    }

    setUserType(user_type) {
        this.user_type = user_type;
    }

    getPlayerLevel() {
        return this.player_level;
    }

    setPlayerLevel(player_level) {
        this.player_level = player_level;
    }

    getTeamId() {
        return this.team_id;
    }

    setTeamId(team_id) {
        this.team_id = team_id;
    }
}