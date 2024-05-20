<?php

function getCommentById($conn, $id) {
    $q = "SELECT * FROM comments WHERE id = '$id'";
    $result = mysqli_query($conn, $q);

    $comments = array();

    while ($comment = mysqli_fetch_assoc($result)) {
        $comments[] = $comment;
    }

    header("Content-Type: application/json");
    return json_encode($comments);
}

?>