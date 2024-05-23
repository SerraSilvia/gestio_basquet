<?php
function createGame($conn) {
    $data = json_decode(file_get_contents("php://input"), true);
    
    $id_booking = $data['id_booking'];
    $tournament_id = $data['tournament_id'];
    $team1_id = $data['team1_id'];
    $team2_id = $data['team2_id'];
    $score_t1 = $data['score_t1'];
    $score_t2 = $data['score_t2'];
    $tourtament_position = $data['tourtament_position'];

    $q = "INSERT INTO GAMES VALUES (DEFAULT, '$id_booking', '$tournament_id', '$team1_id', '$team2_id', '$score_t1', '$score_t2', '$tourtament_position')";
    $result = mysqli_query($conn, $q);

    if ($result) $res = array('status' => 'success');
    else $res = array('status' => 'error');

    header("Content-Type: application/json");
    return json_decode($res);
}

?>