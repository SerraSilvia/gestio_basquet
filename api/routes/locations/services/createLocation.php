<?php

function createLocation($conn) {
    $data = json_decode(file_get_contents("php://input"), true);

    $name = $data['name'];
    $address = $data['address'];
    $created_at = $data['created_at'];
    $updated_at = $data['updated_at'];
    $deleted_at = $data['deleted_at'];

    $q = "INSERT INTO LOCATIONS VALUES (DEFAULT, '$name', '$address', '$created_at', '$updated_at', '$deleted_at'";
    $result = mysqli_query($conn, $q);

    if ($result) $res = array('status' => 'success');
    else $res = array('status' => 'error');

    header("Content-Type: application/json");
    return json_encode($res);
}

?>