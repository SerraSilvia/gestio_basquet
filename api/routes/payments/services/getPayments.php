<?php 

function getPayments($conn) {
    $q = "SELECT * FROM PAYMENTS";
    $result = mysqli_query($conn,$q);

    $payments = array();

    while ($payment = mysqli_fetch_assoc($result)) {
        $payments[] = $payment;
    }

    header("Content-Type: application/json");
    return json_encode($payments);
}

?>