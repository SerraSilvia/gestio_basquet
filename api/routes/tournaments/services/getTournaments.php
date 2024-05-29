<?php 

function getTournaments($conn) {
    $q = "SELECT * FROM TOURNAMENTS";
    $result = mysqli_query($conn,$q);

    $tournaments = array();

    while ($tournament = mysqli_fetch_assoc($result)) {
        $tournaments[] = $tournament;
    }

    header("Content-Type: application/json");
    return json_encode($tournaments);
}

?>