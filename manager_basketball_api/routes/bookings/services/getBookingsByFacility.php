<?php

function getBookingsByFacility($conn, $facility) {
    $q = "SELECT * FROM bookings WHERE facility_id = '$facility'";
    $result = mysqli_query($conn, $q);

    $bookings = array();

    while ($booking = mysqli_fetch_assoc($result)) {
        $bookings[] = $booking;
    }

    header("Content-Type: application/json");
    return json_encode($bookings);
}

?>