<?php
include '../db/connection.php';

include './services/createPeople.php';
include './services/deletePeople.php';
include './services/getPeople.php';
include './services/getPeopleById.php';
include './services/getPeopleByUserType.php';
include './services/getPeopleByTeam.php';
include './services/updatePeople.php';

if ($_SERVER['REQUEST_METHOD'] == 'GET' && !isset($_REQUEST['id']) && !isset($_REQUEST['user_type']) && !isset($_REQUEST['team_id'])) {
    echo getPeople($conn);
}

else if ($_SERVER['REQUEST_METHOD'] == 'GET' && isset($_REQUEST['id']) && !isset($_REQUEST['user_type']) && !isset($_REQUEST['team_id'])) {
    echo getPeopleById($conn, $_REQUEST['id']);
}

else if ($_SERVER['REQUEST_METHOD'] == 'GET' && !isset($_REQUEST['id']) && isset($_REQUEST['user_type']) && !isset($_REQUEST['team_id'])) {
    echo getPeopleByUserType($conn, $_REQUEST['user_type']);
}

else if ($_SERVER['REQUEST_METHOD'] == 'GET' && !isset($_REQUEST['id']) && !isset($_REQUEST['user_type']) && isset($_REQUEST['team_id'])) {
    echo getPeopleByTeam($conn, $_REQUEST['team_id']);
}

else if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    echo createPeople($conn);
}

else if ($_SERVER['REQUEST_METHOD'] == 'PUT' && isset($_REQUEST['id'])) {
    echo updatePeople($conn, $_REQUEST['id']);    
}

else if ($_SERVER['REQUEST_METHOD'] == 'DELETE' && isset($_REQUEST['id'])) {
    echo deletePeople($conn, $_REQUEST['id']);    
}

else {
    echo json_encode(array('status' => 'error', 'code' => 'Invalid request'));
}
?>