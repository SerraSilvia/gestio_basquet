<?php

function createTeam($conn) {
    $data = json_decode(file_get_contents("php://input"), true);

    $name = $data['name'];
    $location_id = $data['location_id'];
    $category = $data['category'];
    $total_score = $data['total_score'];
    $img = $data['img'];
    $captain = $data['captain'];
    $player1 = $data['player1'];
    $player2 = $data['player2'];
    $player3 = $data['player3'];
    $player4 = $data['player4'];

    $q = "INSERT INTO TEAMS VALUES (DEFAULT, '$name', '$location_id', '$category', '$total_score', '$img', '$captain', '$player1', '$player2', '$player3', '$player4'";
    $result = mysqli_query($conn, $q);

    if ($result) $res = array('status' => 'success');
    else $res = array('status' => 'error');

    header("Content-Type: application/json");
    return json_encode($res);
}

?>