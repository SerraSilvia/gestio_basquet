<?php

function getPaymentById($conn, $id) {
    $q = "SELECT * FROM payments WHERE id = '$id'";
    $result = mysqli_query($conn, $q);

    $payments = array();

    while ($payment = mysqli_fetch_assoc($result)) {
        $payments[] = $payment;
    }

    header("Content-Type: application/json");
    return json_encode($payments);
}

?>