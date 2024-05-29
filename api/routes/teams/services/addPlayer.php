<?php

function addPlayer($conn, $id, $user_id, $player) {
    $data = json_decode(file_get_contents('php://input'), true);

    $q = "UPDATE TEAMS SET $player='$user_id' WHERE id='$id'";
    $result = mysqli_query($conn, $q);

    if ($result) {
        $response = array('status' => 'success');
    } else {
        $response = array('status' => 'error');
    }

    header('Content-Type: application/json');
    return json_encode($response);
}

?>
