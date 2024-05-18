<?php

function deleteComment($conn, $id) {
    $q = "DELETE FROM comments WHERE id = '$id'";
    $result = mysqli_query($conn, $q);

    if ($result) $res = array('status' => 'success');
    else $res = array('status' => 'error');

    header("Content-Type: application/json");
    return json_encode($res);
}

?>