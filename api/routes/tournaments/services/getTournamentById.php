<?php

function getTournamentById($conn, $id) {
    $q = "SELECT * FROM tournament WHERE id = '$id'";
    $result = mysqli_query($conn, $q);

    $tournament = mysqli_fetch_assoc($result);

    header('Content-Type: application/json');
    return json_encode($tournament);
}

?>