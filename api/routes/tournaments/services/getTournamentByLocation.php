<?php 

function getTournamentByLocation($conn, $location_id) {
    $q = "SELECT * FROM TOURNAMENTS WHERE location_id = '$location_id'";
    $result = mysqli_query($conn,$q);

    $tournaments = array();

    while ($tournament = mysqli_fetch_assoc($result)) {
        $tournaments[] = $tournament;
    }

    header("Content-Type: application/json");
    return json_encode($tournaments);
}

?>