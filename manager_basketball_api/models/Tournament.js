class Tournament {
    constructor(id, location_id, name, date_start, date_end, created_at, updated_at, deleted_at) {
        this.id = id;
        this.location_id = location_id;
        this.name = name;
        this.date_start = date_start;
        this.date_end = date_end;
        this.created_at = created_at;
        this.updated_at = updated_at;
        this.deleted_at = deleted_at;
    }

    getId() {
        return this.id;
    }

    setId(id) {
        this.id = id;
    }

    getLocationId() {
        return this.location_id;
    }

    setLocationId(location_id) {
        this.location_id = location_id;
    }

    getName() {
        return this.name;
    }

    setName(name) {
        this.name = name;
    }

    getDateStart() {
        return this.date_start;
    }

    setDateStart(date_start) {
        this.date_start = date_start;
    }

    getDateEnd() {
        return this.date_end;
    }

    setDateEnd(date_end) {
        this.date_end = date_end;
    }

    getCreatedAt() {
        return this.created_at;
    }

    setCreatedAt(created_at) {
        this.created_at = created_at;
    }

    getUpdatedAt() {
        return this.updated_at;
    }

    setUpdatedAt(updated_at) {
        this.updated_at = updated_at;
    }

    getDeletedAt() {
        return this.deleted_at;
    }

    setDeletedAt(deleted_at) {
        this.deleted_at = deleted_at;
    }
}