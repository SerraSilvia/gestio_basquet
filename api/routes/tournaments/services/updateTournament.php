<?php

function updateTournament($conn, $id) {
    $data = json_decode(file_get_contents('php://input'), true);

    $location_id = $data['location_id'];
    $name = $data['name'];
    $date_start = $data['date_start'];
    $date_end = $data['date_end'];
    $created_at = $data['created_at'];
    $updated_at = $data['updated_at'];
    $deleted_at = $data['deleted_at'];

    $q = "UPDATE TOURNAMENTS SET location_id='$location_id', name='$name', date_start='$date_start', date_end='$date_end', created_at='$created_at', updated_at='$updated_at', deleted_at='$deleted_at' WHERE id='$id'";
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