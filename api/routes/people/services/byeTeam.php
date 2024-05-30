<?php

function byeTeam($conn, $id) {
    
    $q = "UPDATE PEOPLE SET team_id=NULL, user_type='player' WHERE id=$id";
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
