<?php

function createTeam($conn) {
    $data = json_decode(file_get_contents("php://input"), true);

    $name = $data['name'];
    $location_id = $data['location_id'];
    $category = $data['category'];
    $img = $data['img'];
    $captain = $data['captain'];

    //INSERT INTO TEAMS (name, location_id, category, total_score, img, captain) VALUES ('name', 1, 'senior', 0, 'prueba.img', '220')

    $q = "INSERT INTO TEAMS (name, location_id, category, total_score, img, captain ) VALUES ('$name', $location_id, '$category', 0 , '$img', $captain)";
    $result = mysqli_query($conn, $q);

    if ($result) $res = array('status' => 'success');
    else $res = array('status' => 'error');

    header("Content-Type: application/json");
    return json_encode($res);
}

?>