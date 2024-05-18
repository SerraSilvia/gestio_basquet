class Location {
    constructor(id, name, address, created_at, updated_at, deleted_at) {
        this.id = id;
        this.name = name;
        this.address = address;
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

    getName() {
        return this.name;
    }

    setName(name) {
        this.name = name;
    }

    getAddress() {
        return this.address;
    }

    setAddress(address) {
        this.address = address;
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