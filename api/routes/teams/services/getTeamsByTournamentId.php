<?php

function getTeamsByTournamentId($conn, $tournament_id) {
    $q = "SELECT * FROM TEAMS WHERE tournament_id='$tournament_id'";
    $result = mysqli_query($conn, $q);

    $teams = array();

    while ($team = mysqli_fetch_assoc($result)) {
        $teams[] = $team;
    }

    header("Content-Type: application/json");
    return json_encode($teams);
}

?>