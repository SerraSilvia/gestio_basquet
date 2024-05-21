<?php

include '../db/connection.php';

include './services/getFacilities.php';
include './services/getFacilityById.php';
include './services/getFacilityByLocation.php';
include './services/createFacility.php';
include './services/deleteFacility.php';

if ($_SERVER['REQUEST_METHOD'] == 'GET' && !isset($_REQUEST['id']) && !isset($_REQUEST['location_id'])) {
    echo getFacilities($conn); 
}

else if ($_SERVER['REQUEST_METHOD'] == 'GET' && isset($_REQUEST['id']) && !isset($_REQUEST['location_id'])) {
    echo getFacilityById($conn, $_REQUEST['id']);
}

else if ($_SERVER['REQUEST_METHOD'] == 'GET' && !isset($_REQUEST['id']) && isset($_REQUEST['location_id'])) {
    echo getFacilityByLocation($conn, $_REQUEST['location_id']);
}

else if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    echo createFacility($conn);
}

else if ($_SERVER['REQUEST_METHOD'] == 'DELETE' && isset($_REQUEST['id'])) {
    echo deleteFacility($conn, $_REQUEST['id']);
}

else {
    echo json_encode(array('status' => 'error', 'code' => 'Invalid request'));
}

?>