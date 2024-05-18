class Comment {
    constructor(id, player_id, person_create_id, comment, created_at, updated_at) {
        this.id = id;
        this.player_id = player_id;
        this.person_create_id = person_create_id;
        this.comment = comment;
        this.created_at = created_at;
        this.updated_at = updated_at;
    }

    getId() {
        return this.id;
    }

    setId(id) {
        this.id = id;
    }

    getPlayerId() {
        return this.player_id;
    }

    setPlayerId(player_id) {
        this.player_id = player_id;
    }

    getPersonCreateId() {
        return this.person_create_id;
    }

    setPersonCreateId(person_create_id) {
        this.person_create_id = person_create_id;
    }

    getComment() {
        return this.comment;
    }

    setComment(comment) {
        this.comment = comment;
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
}