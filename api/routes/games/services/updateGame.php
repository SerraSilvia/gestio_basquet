<?php

function updateGame($conn, $id) {
    $data = json_decode(file_get_contents('php://input'), true);

    $id_booking = $data['id_booking'];
    $tournament_id = $data['tournament_id'];
    $team1_id = $data['team1_id'];
    $team2_id = $data['team2_id'];
    $score_t1 = $data['score_t1'];
    $score_t2 = $data['score_t2'];
    $tournament_position = $data['tournament_position'];

    $q = "UPDATE GAMES SET id_booking='$id_booking', tournament_id='$tournament_id', team1_id='$team1_id', team2_id='$team2_id', score_t1='$score_t1', score_t2='$score_t2', tournament_position='$tournament_position' WHERE id=$id";
    echo $q;
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