class Booking {
    constructor(id, facility_id, person_id, date_start, date_end, reservation_status, reservation_type) {
        this.id = id;
        this.facility_id = facility_id;
        this.person_id = person_id;
        this.date_start = date_start;
        this.date_end = date_end;
        this.reservation_status = reservation_status;
        this.reservation_type = reservation_type;
    }

    getId() {
        return this.id;
    }

    setId(id) {
        this.id = id;
    }

    getFacilityId() {
        return this.facility_id;
    }

    setFacilityId(facility_id) {
        this.facility_id = facility_id;
    }

    getPersonId() {
        return this.person_id;
    }

    setPersonId(person_id) {
        this.person_id = person_id;
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

    getReservationStatus() {
        return this.reservation_status;
    }

    setReservationStatus(reservation_status) {
        this.reservation_status = reservation_status;
    }

    getReservationType() {
        return this.reservation_type;
    }

    setReservationType(reservation_type) {
        this.reservation_type = reservation_type;
    }
}