<?php
include '../../db/connection.php';

include './services/getBookings.php';
include './services/getBookingsByFacility.php';
include './services/getBookingsByUserId.php';
include './services/createBooking.php';
include './services/deleteBooking.php';

if ($_SERVER['REQUEST_METHOD'] == 'GET' && !isset($_REQUEST['facility']) && !isset($_REQUEST['user_id'])) {
    echo getBookings($conn);
}

else if ($_SERVER['REQUEST_METHOD'] == 'GET' && isset($_REQUEST['facility']) && !isset($_REQUEST['user_id'])) {
    echo getBookingsByFacility($conn, $_REQUEST['facility']);
}

else if ($_SERVER['REQUEST_METHOD'] == 'GET' && !isset($_REQUEST['facility']) && isset($_REQUEST['user_id'])) {
    echo getBookingsByUserId($conn, $_REQUEST['user_id']);
}

else if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    echo createBooking($conn);
}

else if ($_SERVER['REQUEST_METHOD'] == 'DELETE' && isset($_REQUEST['id'])) {
    echo deleteBooking($conn, $_REQUEST['id']);
}

else {
    echo json_encode(array('status' => 'error', 'code' => 'Invalid request'));
}

?>