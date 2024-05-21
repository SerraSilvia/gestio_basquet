<?php

function createTeam($conn) {
    $data = json_decode(file_get_contents("php://input"), true);

    $name = $data['name'];
    $location_id = $data['location_id'];
    $category = $data['category'];
    $total_score = $data['total_score'];
    $img = $data['img'];

    $q = "INSERT INTO teams VALUES (DEFAULT, '$name', '$location_id', '$category', '$total_score', '$img'";
    $result = mysqli_query($conn, $q);

    if ($result) $res = array('status' => 'success');
    else $res = array('status' => 'error');

    header("Content-Type: application/json");
    return json_encode($res);
}

?>