<?php

function deleteTeamPlayer($conn, $team_id, $user_id) {
    $query = "SELECT player1, player2, player3, player4 FROM TEAMS WHERE id='$team_id'";
    $result = mysqli_query($conn, $query);
    
    if (!$result) {
        return json_encode(array('status' => 'error', 'message' => 'Error al obtener el equipo: ' . mysqli_error($conn)));
    }

    $team = mysqli_fetch_assoc($result);
    
    $playerField = null;
    if ($team['player1'] == $user_id) {
        $playerField = 'player1';
    } elseif ($team['player2'] == $user_id) {
        $playerField = 'player2';
    } elseif ($team['player3'] == $user_id) {
        $playerField = 'player3';
    } elseif ($team['player4'] == $user_id) {
        $playerField = 'player4';
    } else {
        return json_encode(array('status' => 'error', 'message' => 'El jugador no pertenece a este equipo'));
    }
    
    $updateTeamQuery = "UPDATE TEAMS SET $playerField='0' WHERE id='$team_id'";
    $updateTeamResult = mysqli_query($conn, $updateTeamQuery);

    if ($updateTeamResult) {
        return json_encode(array('status' => 'success'));
    } else {
        return json_encode(array('status' => 'error', 'message' => 'Error al actualizar el equipo: ' . mysqli_error($conn)));
    }
}

?>
