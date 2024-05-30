<?php
include '../../db/connection.php';

include './services/getPeople.php';
include './services/createPeople.php';
include './services/deletePeople.php';
include './services/getPeopleByEmail.php';
include './services/updatePeople.php';
include './services/getPeopleById.php';
include './services/getPeopleByUserType.php';
include './services/getPeopleByTeam.php';
include './services/newCaptain.php'; 
include './services/byeTeam.php'; 

if ($_SERVER['REQUEST_METHOD'] == 'GET' && !isset($_REQUEST['id']) && !isset($_REQUEST['user_type']) && !isset($_REQUEST['team_id']) && !isset($_REQUEST['email'])) {
    echo getPeople($conn);
}

else if ($_SERVER['REQUEST_METHOD'] == 'GET' && isset($_REQUEST['id']) && !isset($_REQUEST['user_type']) && !isset($_REQUEST['team_id']) && !isset($_REQUEST['email'])) {
    echo getPeopleById($conn, $_REQUEST['id']);
}

else if ($_SERVER['REQUEST_METHOD'] == 'GET' && !isset($_REQUEST['id']) && isset($_REQUEST['user_type']) && !isset($_REQUEST['team_id']) && !isset($_REQUEST['email'])) {
    echo getPeopleByUserType($conn, $_REQUEST['user_type']);
}

else if ($_SERVER['REQUEST_METHOD'] == 'GET' && !isset($_REQUEST['id']) && !isset($_REQUEST['user_type']) && isset($_REQUEST['team_id']) && !isset($_REQUEST['email'])) {
    echo getPeopleByTeam($conn, $_REQUEST['team_id']);
}

else if ($_SERVER['REQUEST_METHOD'] == 'GET' && !isset($_REQUEST['id']) && !isset($_REQUEST['user_type']) && !isset($_REQUEST['team_id']) && isset($_REQUEST['email'])) {
    echo getPeopleByEmail($conn, $_REQUEST['email']);
}

else if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    echo createPeople($conn);
}

else if ($_SERVER['REQUEST_METHOD'] == 'PUT' && !isset($_REQUEST['action'])) {
    echo updatePeople($conn);    
}

else if ($_SERVER['REQUEST_METHOD'] == 'PUT' && isset($_REQUEST['action']) && $_REQUEST['action'] == 'newCaptain') {
    $data = json_decode(file_get_contents('php://input'), true);
    echo newCaptain($conn, $data['id'], $data['team_id']);
}

else if ($_SERVER['REQUEST_METHOD'] == 'PUT' && isset($_REQUEST['action']) && $_REQUEST['action'] == 'byeTeam') {
    $data = json_decode(file_get_contents('php://input'), true);
    echo byeTeam($conn, $data['id']);
}

else if ($_SERVER['REQUEST_METHOD'] == 'DELETE' && isset($_REQUEST['id'])) {
    echo deletePeople($conn, $_REQUEST['id']);    
}

else {
    echo json_encode(array('status' => 'error', 'code' => 'Invalid request'));
}
?>
