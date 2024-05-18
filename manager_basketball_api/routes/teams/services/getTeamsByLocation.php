<?php

function getTeamsByLocation($conn, $location_id) {
    $q = "SELECT * FROM teams WHERE location_id='$location_id'";
    $result = mysqli_query($conn, $q);

    $teams = array();

    while ($team = mysqli_fetch_assoc($result)) {
        $teams[] = $team;
    }

    header("Content-Type: application/json");
    return json_encode($teams);
}

?>