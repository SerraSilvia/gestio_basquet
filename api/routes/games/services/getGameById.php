<?php 

function getGameById($conn, $id) {
    $q = "SELECT * FROM GAMES WHERE id = '$id'";
    $result = mysqli_query($conn,$q);

    $games = array();

    while ($game = mysqli_fetch_assoc($result)) {
        $games[] = $game;
    }

    header("Content-Type: application/json");
    return json_encode($games);
}

?>