<?php

function createPayment($conn) {
    $data = json_decode(file_get_contents("php://input"), true);

    $person_id = $data['person_id'];
    $quantity = $data['quantity'];
    $concept = $data['concept'];
    $date = $data['date'];

    $q = "INSERT INTO payments VALUES (DEFAULT, '$person_id', '$quantity', '$concept', '$date'";
    $result = mysqli_query($conn, $q);

    if ($result) $res = array('status' => 'success');
    else $res = array('status' => 'error');

    header("Content-Type: application/json");
    return json_encode($res);
}

?>