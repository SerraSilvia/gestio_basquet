<?php

function getTeamsOrderByRanking($conn, $total_score) {
    $q = "SELECT * FROM TEAMS ORDER BY total_score";
    $result = mysqli_query($conn, $q);

    $teams = array();

    while ($team = mysqli_fetch_assoc($result)) {
        $teams[] = $team;
    }

    header("Content-Type: application/json");
    return json_encode($teams);
}

?>