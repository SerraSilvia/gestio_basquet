<?php

function newCaptain($conn, $id, $team_id) {
    
    $q = "UPDATE PEOPLE SET team_id='$team_id', user_type='captain' WHERE id=$id";
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
