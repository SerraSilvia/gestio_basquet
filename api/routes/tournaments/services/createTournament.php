<?php
function createTournament($conn) {
    $data = json_decode(file_get_contents("php://input"), true);
     
    $location_id = $data['location_id'];
    $name = $data['name'];
    $date_start = $data['date_start'];
    $date_end = $data['date_end'];
    $created_at = $data['created_at'];
    $updated_at = $data['updated_at'];
    $deleted_at = $data['deleted_at'];

    $q = "INSERT INTO tournaments VALUES (DEFAULT, '$location_id', '$name', '$date_start', '$date_end', '$created_at', '$updated_at', '$deleted_at')";
    $result = mysqli_query($conn, $q);

    if ($result) $res = array('status' => 'success');
    else $res = array('status' => 'error');

    header("Content-Type: application/json");
    return json_decode($res);
}

?>