<?php

function getTeamsById($conn, $id) {
    $q = "SELECT * FROM teams WHERE id='$id'";
    $result = mysqli_query($conn, $q);

    $teams = array();

    while ($team = mysqli_fetch_assoc($result)) {
        $teams[] = $team;
    }

    header("Content-Type: application/json");
    return json_encode($teams);
}

?>