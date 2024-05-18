class Facility {
    constructor(id, location_id, name, facility_type, facility_status) {
        this.id = id;
        this.location_id = location_id;
        this.name = name;
        this.facility_type = facility_type;
        this.facility_status = facility_status;
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

    getFacilityType() {
        return this.facility_type;
    }

    setFacilityType(facility_type) {
        this.facility_type = facility_type;
    }

    getFacilityStatus() {
        return this.facility_status;
    }

    setFacilityStatus(facility_status) {
        this.facility_status = facility_status;
    }
}