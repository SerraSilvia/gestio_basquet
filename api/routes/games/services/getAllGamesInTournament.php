<?php 

function getAllGamesInTournament($conn, $tournament_id) {
    $q = "SELECT * FROM games WHERE tournament_id = '$tournament_id'";
    $result = mysqli_query($conn,$q);

    $games = array();

    while ($game = mysqli_fetch_assoc($result)) {
        $games[] = $game;
    }

    header("Content-Type: application/json");
    return json_encode($games);
}

?>