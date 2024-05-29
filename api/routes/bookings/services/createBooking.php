<?php

function createBooking($conn) {
    $data = json_decode(file_get_contents("php://input"), true);

    $facility_id = $data['facility_id'];
    $person_id = $data['person_id'];
    $date_start = $data['date_start'];
    $date_end = $data['date_end'];
    $reservation_status = "pending";
    $reservation_type = $data['reservation_type'];

    $q = "INSERT INTO BOOKINGS (facility_id, person_id, date_start, date_end, reservation_status, reservation_type) VALUES ($facility_id, $person_id, '$date_start', '$date_end', '$reservation_status', '$reservation_type')";
    $result = mysqli_query($conn, $q);

    if ($result) $res = array('status' => 'success');
    else $res = array('status' => 'error');

    header("Content-Type: application/json");
    return json_encode($res);
}

?>