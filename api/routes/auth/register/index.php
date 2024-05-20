<?php
include "../../db/connection.php";

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    $data = json_decode(file_get_contents("php://input"), true);
    
    // User info
    $name = $data['name'];
    $surnames = $data['surnames'];
    $dni = $data['dni']; 
    $email = $data['email'];
    $password = md5($data['password']);
    $birthdate = $data['birthdate'];
    $user_type = $data['user_type'];
    $player_level = $data['player_level'];
    $team_id = $data['team_id'];

    $q = "INSERT INTO people VALUES ('$name', '$surnames', '$dni', '$email', '$password', '$birthdate', '$user_type', '$player_level', '$team_id')";
    $result = mysqli_query($conn, $q);

    $res = array();
    if ($result) {
        $res['token'] = base64_encode(random_bytes(32));
        $res['auth_level'] = $user_type;
    } else {
        $res = array('status' => 'error');
    }

    header("Content-Type: application/json");
    echo json_encode($res);
}

?>