<?php

function getBookingsByUserId($conn, $user_id) {
    $q = "SELECT * FROM BOOKINGS WHERE person_id = '$user_id'";
    $result = mysqli_query($conn, $q);

    $bookings = array();

    while ($booking = mysqli_fetch_assoc($result)) {
        $bookings[] = $booking;
    }

    header("Content-Type: application/json");
    return json_encode($bookings);
}

?>