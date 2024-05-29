<?php 

function getBookings($conn) {
    $q = "SELECT * FROM BOOKINGS";
    $result = mysqli_query($conn,$q);

    $bookings = array();

    while ($booking = mysqli_fetch_assoc($result)) {
        $bookings[] = $booking;
    }

    header("Content-Type: application/json");
    return json_encode($bookings);
}

?>