<?php

function updateLocation($conn, $id) {
    $data = json_decode(file_get_contents('php://input'), true);

    $name = $data['name'];
    $address = $data['address'];
    $created_at = $data['created_at'];
    $updated_at = $data['updated_at'];
    $deleted_at = $data['deleted_at'];

    $q = "UPDATE location SET name='$name', address='$address', created_at='$created_at', updated_at='$updated_at', deleted_at='$deleted_at' WHERE id='$id'";
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