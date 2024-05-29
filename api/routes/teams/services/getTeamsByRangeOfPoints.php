<?php

function getTeamsByRangeOfPoints($conn, $minPoints, $maxPoints) {
    $q = "SELECT * FROM TEAMS WHERE total_score BETWEEN '$minPoints' AND '$maxPoints' ORDER BY total_score";
    $result = mysqli_query($conn, $q);

    $teams = array();

    while ($team = mysqli_fetch_assoc($result)) {
        $teams[] = $team;
    }

    header("Content-Type: application/json");
    return json_encode($teams);
}

?>