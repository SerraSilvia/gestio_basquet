<?php

include '../db/connection.php';

include './services/getLocations.php';
include './services/getLocationById.php';
include './services/createLocation.php';
include './services/updateLocation.php';
include './services/deleteLocation.php';

if ($_SERVER['REQUEST_METHOD'] == 'GET' && !isset($_REQUEST['id'])) {
    echo getLocations($conn); 
}

else if ($_SERVER['REQUEST_METHOD'] == 'GET' && isset($_REQUEST['id'])) {
    echo getLocationById($conn, $_REQUEST['id']);
}

else if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    echo createLocation($conn);
}

else if ($_SERVER['REQUEST_METHOD'] == 'PUT' && isset($_REQUEST['id'])) {
    echo updateLocation($conn, $_REQUEST['id']);    
}

else if ($_SERVER['REQUEST_METHOD'] == 'DELETE' && isset($_REQUEST['id'])) {
    echo deleteLocation($conn, $_REQUEST['id']);
}

else {
    echo json_encode(array('status' => 'error', 'code' => 'Invalid request'));
}

?>