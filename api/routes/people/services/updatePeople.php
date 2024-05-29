<?php

function updatePeople($conn) {
    $data = json_decode(file_get_contents('php://input'), true);

    $id=$data['id'];
    $name = $data['name'];
    $surnames = $data['surnames'];
    $email = $data['email'];
    $password = md5($data['password']);
    $birthdate = $data['birthdate'];
    $user_type = $data['user_type'];
    $player_level = $data['player_level'];
    $team_id = $data['team_id'];
    $profile_img = $data['profile_img'];

    $q = "UPDATE PEOPLE SET name='$name', surnames='$surnames', email='$email' , password='$password', birthdate='$birthdate', user_type='$user_type', player_level='$player_level', team_id=$team_id, profile_img=$profile_img WHERE id=$id";
    $result = mysqli_query($conn, $q);

    if ($result) {
        $response = array('status' => 'success');
    } else {
        $response = array('status' => 'error');
    }

    header('Content-Type: application/json');
    return json_encode($response);
}

?>