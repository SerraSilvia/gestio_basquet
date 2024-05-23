<?php

function createPeople($conn) {
    $data = json_decode(file_get_contents("php://input"), true);

    $name = $data['name'];
    $surnames = $data['surnames'];
    $dni = $data['dni'];
    $email = $data['email'];
    $password = $data['password'];
    $birthdate = $data['birthdate'];
    $user_type = $data['user_type'];
    $player_level = $data['player_level'];
    $team_id = $data['team_id'];

    $q = "INSERT INTO people VALUES (DEFAULT, '$name', '$surnames', '$dni', '$email', '$password', '$birthdate', '$user_type', '$player_level', '$team_id'";
    $result = mysqli_query($conn, $q);

    if ($result) $res = array('status' => 'success');
    else $res = array('status' => 'error');

    header("Content-Type: application/json");
    return json_encode($res);
}

?>