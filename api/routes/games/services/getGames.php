<?php 

function getGames($conn) {
    $q = "SELECT * FROM GAMES";
    $result = mysqli_query($conn,$q);

    $games = array();

    while ($game = mysqli_fetch_assoc($result)) {
        $games[] = $game;
    }

    header("Content-Type: application/json");
    return json_encode($games);
}

?>