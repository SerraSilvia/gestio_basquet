class Payment {
    constructor(id, person_id, quantity, concept, date) {
        this.id = id;
        this.person_id = person_id;
        this.quantity = quantity;
        this.concept = concept;
        this.date = date;
    }

    getId() {
        return this.id;
    }

    setId(id) {
        this.id = id;
    }

    getPersonId() {
        return this.person_id;
    }

    setPersonId(person_id) {
        this.person_id = person_id;
    }

    getQuantity() {
        return this.quantity;
    }

    setQuantity(quantity) {
        this.quantity = quantity;
    }

    getConcept() {
        return this.concept;
    }

    setConcept(concept) {
        this.concept = concept;
    }

    getDate() {
        return this.date;
    }

    setDate(date) {
        this.date = date;
    }
}
