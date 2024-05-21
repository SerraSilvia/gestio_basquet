<?php 

function getFirstRoundGames($conn, $tournament_id) {
    $q = "SELECT * FROM games WHERE tournament_id = '$tournament_id' AND tournament_position BETWEEN 1 AND 4";

    $result = mysqli_query($conn,$q);

    $games = array();

    while ($game = mysqli_fetch_assoc($result)) {
        $games[] = $game;
    }

    header("Content-Type: application/json");
    return json_encode($games);
}

?>