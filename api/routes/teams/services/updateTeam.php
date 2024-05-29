<?php

function updateTeam($conn, $id) {
    $data = json_decode(file_get_contents('php://input'), true);

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
    $tournament_id = $data['tournament_id'];

    $q = "UPDATE TEAMS SET name='$name', location_id='$location_id', category='$category', total_score='$total_score' , img='$img', captain='$captain', player1='$player1', player2='$player2', player3='$player3' , player4='$player4', tournament_id='$tournament_id' WHERE id='$id'";
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