<?php 

function getTournamentById($conn, $id) {
    $q = "SELECT * FROM tournaments WHERE id = '$id'";
    $result = mysqli_query($conn,$q);

    $tournaments = array();

    while ($tournament = mysqli_fetch_assoc($result)) {
        $tournaments[] = $tournament;
    }

    header("Content-Type: application/json");
    return json_encode($tournaments);
}

?>