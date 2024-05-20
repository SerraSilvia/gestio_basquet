<?php

include '../db/connection.php';

include './services/getTeams.php';
include './services/getTeamById.php';
include './services/getTeamsByLocation.php';
include './services/getTeamsOrderByRanking.php';
include './services/createTeam.php';
include './services/updateTeam.php';
include './services/deleteTeam.php';

if ($_SERVER['REQUEST_METHOD'] == 'GET' && !isset($_REQUEST['id']) && !isset($_REQUEST['location_id']) && !isset($_REQUEST['total_score'])) {
    echo getTeams($conn); 
}

else if ($_SERVER['REQUEST_METHOD'] == 'GET' && isset($_REQUEST['id']) && !isset($_REQUEST['location_id']) && !isset($_REQUEST['total_score'])) {
    echo getTeamById($conn, $_REQUEST['id']);
}

else if ($_SERVER['REQUEST_METHOD'] == 'GET' && !isset($_REQUEST['id']) && isset($_REQUEST['location_id']) && !isset($_REQUEST['total_score'])) {
    echo getTeamsByLocation($conn, $_REQUEST['location_id']);
}

else if ($_SERVER['REQUEST_METHOD'] == 'GET' && !isset($_REQUEST['id']) && !isset($_REQUEST['location_id']) && isset($_REQUEST['total_score'])) {
    echo getTeamsOrderByRanking($conn, $_REQUEST['total_score']);
}

else if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    echo createTeam($conn);
}

else if ($_SERVER['REQUEST_METHOD'] == 'PUT' && isset($_REQUEST['id'])) {
    echo updateTeam($conn, $_REQUEST['id']);    
}

else if ($_SERVER['REQUEST_METHOD'] == 'DELETE' && isset($_REQUEST['id'])) {
    echo deleteTeam($conn, $_REQUEST['id']);
}

else {
    echo json_encode(array('status' => 'error', 'code' => 'Invalid request'));
}

?>