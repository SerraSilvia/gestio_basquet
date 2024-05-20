class Team {
    constructor(id, name, location_id, category, total_score) {
        this.id = id;
        this.name = name;
        this.location_id = location_id;
        this.category = category;
        this.total_score = total_score;
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

    getLocationId() {
        return this.location_id;
    }

    setLocationId(location_id) {
        this.location_id = location_id;
    }

    getCategory() {
        return this.category;
    }

    setCategory(category) {
        this.category = category;
    }

    getTotalScore() {
        return this.total_score;
    }

    setTotalScore(total_score) {
        this.total_score = total_score;
    }
}
