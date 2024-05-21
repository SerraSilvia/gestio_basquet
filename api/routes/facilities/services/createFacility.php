<?php

function createFacility($conn) {
    $data = json_decode(file_get_contents("php://input"), true);

    $location_id = $data['location_id'];
    $name = $data['name'];
    $facility_type = $data['facility_type'];
    $facility_status = $data['facility_status'];

    $q = "INSERT INTO facilities VALUES (DEFAULT, '$location_id', '$name', '$facility_type', '$facility_status'";
    $result = mysqli_query($conn, $q);

    if ($result) $res = array('status' => 'success');
    else $res = array('status' => 'error');

    header("Content-Type: application/json");
    return json_encode($res);
}

?>