<?php

function addPlayer($conn, $team_id, $user_id) {

    $query = "SELECT player1, player2, player3, player4 FROM TEAMS WHERE id='$team_id'";
    $result = mysqli_query($conn, $query);
    
    if (!$result) {
        return json_encode(array('status' => 'error', 'message' => 'Error al obtener el equipo'));
    }

    $team = mysqli_fetch_assoc($result);
    
    
    $playerField = null;
    if ($team['player1'] == 0) {
        $playerField = 'player1';
    } elseif ($team['player2'] == 0) {
        $playerField = 'player2';
    } elseif ($team['player3'] == 0) {
        $playerField = 'player3';
    } elseif ($team['player4'] == 0) {
        $playerField = 'player4';
    } else {
        return json_encode(array('status' => 'error', 'message' => 'No hay posiciones vacantes disponibles'));
    }
    
    $updateQuery = "UPDATE TEAMS SET $playerField='$user_id' WHERE id='$team_id'";
    $updateResult = mysqli_query($conn, $updateQuery);

    if ($updateResult) {
        return json_encode(array('status' => 'success'));
    } else {
        return json_encode(array('status' => 'error', 'message' => 'Error al actualizar el equipo'));
    }
}

?>
