<?php
include "../../db/connection.php";

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $data = json_decode(file_get_contents("php://input"), true);

    $name = $data['name'];
    $surnames = $data['surnames'];
    $dni = $data['dni'];
    $email = $data['email'];
    $password = md5($data['password']);
    $birthdate = $data['birthdate'];
    $user_type = $data['user_type'];
    $player_level = $data['player_level'];

    $q = "INSERT INTO PEOPLE (name, surnames, dni, email, password, birthdate, user_type, player_level) VALUES ('$name', '$surnames', '$dni', '$email', '$password', '$birthdate', '$user_type', '$player_level')";
    
    $result = mysqli_query($conn, $q);

    $res = array();
    if ($result) {
        $res = array('status' => 'success');
    } else {
        $res = array('status' => 'error');
    }

    header("Content-Type: application/json");
    echo json_encode($res);
}

?>