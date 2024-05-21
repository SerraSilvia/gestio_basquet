<?php
include '../db/connection.php';

include './services/createPeople.php';
include './services/deletePeople.php';
include './services/getPeople.php';
include './services/getPeopleById.php';
include './services/getPeopleByUserType.php';
include './services/getPeopleByTeam.php';
include './services/updatePeople.php';

if ($_SERVER['REQUEST_METHOD'] == 'GET' && !isset($_REQUEST['id']) && !isset($_REQUEST['location_id'])) {
    echo getTournaments($conn);
}

else if ($_SERVER['REQUEST_METHOD'] == 'GET' && isset($_REQUEST['id']) && !isset($_REQUEST['location_id'])) {
    echo getTournamentById($conn, $_REQUEST['id']);
}

else if ($_SERVER['REQUEST_METHOD'] == 'GET' && !isset($_REQUEST['id']) && isset($_REQUEST['location_id'])) {
    echo getTournamentByLocation($conn, $_REQUEST['location_id']);
}

else if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    echo createTournament($conn);
}

else if ($_SERVER['REQUEST_METHOD'] == 'PUT' && isset($_REQUEST['id'])) {
    echo updateTournament($conn, $_REQUEST['id']);    
}

else if ($_SERVER['REQUEST_METHOD'] == 'DELETE' && isset($_REQUEST['id'])) {
    echo deleteTournament($conn, $_REQUEST['id']);    
}

else {
    echo json_encode(array('status' => 'error', 'code' => 'Invalid request'));
}
?>