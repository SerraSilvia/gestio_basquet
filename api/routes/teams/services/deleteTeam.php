<?php

function deleteTeam($conn, $id) {
    $q = "DELETE FROM TEAMS WHERE id = '$id'";
    $result = mysqli_query($conn, $q);

    if ($result) $res = array('status' => 'success');
    else $res = array('status' => 'error');

    header("Content-Type: application/json");
    return json_encode($res);
}

?>