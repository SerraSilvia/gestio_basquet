<?php

function getCommentsByPlayerId($conn, $player_id) {
    $q = "SELECT * FROM COMMENTS WHERE player_id = '$player_id'";
    $result = mysqli_query($conn, $q);

    $comments = array();

    while ($comment = mysqli_fetch_assoc($result)) {
        $comments[] = $comment;
    }

    header("Content-Type: application/json");
    return json_encode($comments);
}

?>