<?php
include '../../db/connection.php';

include './services/getPayments.php';
include './services/getPaymentByUserId.php';
include './services/getPaymentById.php';
include './services/createPayment.php';
include './services/deletePayment.php';

if ($_SERVER['REQUEST_METHOD'] == 'GET' && !isset($_REQUEST['id'])) {
    echo getPayments($conn); 
}
/* TODO: mirar porque da error
else if ($_SERVER['REQUEST_METHOD'] == 'GET' && isset($_REQUEST['id'] && !isset($_REQUEST['user_id']))) {
    echo getPaymentById($conn, $_REQUEST['id']);
}*/

else if ($_SERVER['REQUEST_METHOD'] == 'GET' && !isset($_REQUEST['id']) && isset($_REQUEST['user_id'])) {
    echo getPaymentByUserId($conn, $_REQUEST['user_id']);
}

else if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    echo createPayment($conn);
}

else if ($_SERVER['REQUEST_METHOD'] == 'DELETE' && isset($_REQUEST['id'])) {
    echo deletePayment($conn, $_REQUEST['id']);
}

else {
    echo json_encode(array('status' => 'error', 'code' => 'Invalid request'));
}

?>