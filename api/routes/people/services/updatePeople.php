<?php

function updatePeople($conn, $id) {
    $data = json_decode(file_get_contents('php://input'), true);

    $name = $data['name'];
    $surnames = $data['surnames'];
    $dni = $data['dni'];
    $email = $data['email'];
    $password = $data['password'];
    $birthdate = $data['birthdate'];
    $user_type = $data['user_type'];
    $player_level = $data['player_level'];
    $team_id = $data['team_id'];

    $q = "UPDATE PEOPLE SET name='$name', surnames='$surnames', dni='$dni', email='$email' , password='$password', birthdate='$birthdate', user_type='$user_type', player_level='$player_level', team_id='$team_id' WHERE id='$id'";
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