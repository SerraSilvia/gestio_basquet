<?php 

function getSemifinalsGames($conn, $tournament_id) {
    $q = "SELECT * FROM GAMES WHERE tournament_id = '$tournament_id' AND tournament_position IN (5, 6)";

    $result = mysqli_query($conn,$q);

    $games = array();

    while ($game = mysqli_fetch_assoc($result)) {
        $games[] = $game;
    }

    header("Content-Type: application/json");
    return json_encode($games);
}

?>