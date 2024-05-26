<?php

function getPaymentByUserId($conn, $user_id) {
    $q = "SELECT * FROM PAYMENTS WHERE person_id = '$user_id'";
    $result = mysqli_query($conn, $q);

    $payments = array();

    while ($payment = mysqli_fetch_assoc($result)) {
        $payments[] = $payment;
    }

    header("Content-Type: application/json");
    return json_encode($payments);
}

?>