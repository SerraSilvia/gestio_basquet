<?php
function createTournament($conn) {
    $data = json_decode(file_get_contents("php://input"), true);
    
    $location_id = $data['location_id'];
    $name = $data['name'];
    $date_start = $data['date_start'];
    $date_end = $data['date_end'];
    $created_at = $data['created_at'];
    $updated_at = $data['updated_at'];

    $q = "INSERT INTO TOURNAMENTS (location_id, name, date_start, date_end, created_at, updated_at) VALUES ($location_id, '$name', '$date_start', '$date_end', '$created_at', '$updated_at')";
    echo  $q;
    $result = mysqli_query($conn, $q);

    if ($result) $res = array('status' => 'success');
    else $res = array('status' => 'error');

    header("Content-Type: application/json");
    return json_decode($res);
}

?>