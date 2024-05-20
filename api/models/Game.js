class Game {
    constructor(id, id_booking, tournament_id, team1_id, team2_id, score_t1, score_t2) {
        this.id = id;
        this.id_booking = id_booking;
        this.tournament_id = tournament_id;
        this.team1_id = team1_id;
        this.team2_id = team2_id;
        this.score_t1 = score_t1;
        this.score_t2 = score_t2;
    }

    getId() {
        return this.id;
    }

    setId(id) {
        this.id = id;
    }

    getIdBooking() {
        return this.id_booking;
    }

    setIdBooking(id_booking) {
        this.id_booking = id_booking;
    }

    getTournamentId() {
        return this.tournament_id;
    }

    setTournamentId(tournament_id) {
        this.tournament_id = tournament_id;
    }

    getTeam1Id() {
        return this.team1_id;
    }

    setTeam1Id(team1_id) {
        this.team1_id = team1_id;
    }

    getTeam2Id() {
        return this.team2_id;
    }

    setTeam2Id(team2_id) {
        this.team2_id = team2_id;
    }

    getScoreT1() {
        return this.score_t1;
    }

    setScoreT1(score_t1) {
        this.score_t1 = score_t1;
    }

    getScoreT2() {
        return this.score_t2;
    }

    setScoreT2(score_t2) {
        this.score_t2 = score_t2;
    }
}