<?php

function createComment($conn) {
    $data = json_decode(file_get_contents("php://input"), true);

    $player_id = $data['player_id'];
    $person_create_id = $data['person_create_id'];
    $comment = $data['comment'];
    $created_at = $data['created_at'];
    $updated_at = $data['updated_at'];
    $deleted_at = $data['deleted_at'];

    $q = "INSERT INTO valoracio VALUES (DEFAULT, '$player_id', '$person_create_id', '$comment', '$created_at', '$updated_at', '$deleted_at'";
    $result = mysqli_query($conn, $q);

    if ($result) $res = array('status' => 'success');
    else $res = array('status' => 'error');

    header("Content-Type: application/json");
    return json_encode($res);
}

?>