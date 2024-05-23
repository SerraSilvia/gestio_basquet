<?php
include '../db/connection.php';

include './services/createGame.php';
include './services/deleteGame.php';
include './services/getGames.php';
include './services/getGameById.php';
include './services/getAllGamesInTournament.php';
include './services/getFirstRoundGames.php';
include './services/getSemifinalsGames.php';
include './services/getFinalGame.php';
include './services/updateGame.php';

if ($_SERVER['REQUEST_METHOD'] == 'GET' && !isset($_REQUEST['id']) && !isset($_REQUEST['tournament_id']) && !isset($_REQUEST['firstRoundGames']) && !isset($_REQUEST['semisGames']) && !isset($_REQUEST['finalGame'])) {
    echo getGames($conn);
}

else if ($_SERVER['REQUEST_METHOD'] == 'GET' && isset($_REQUEST['id']) && !isset($_REQUEST['tournament_id']) && !isset($_REQUEST['firstRoundGames']) && !isset($_REQUEST['semisGames']) && !isset($_REQUEST['finalGame'])) {
    echo getGameById($conn, $_REQUEST['id']);
}

else if ($_SERVER['REQUEST_METHOD'] == 'GET' && !isset($_REQUEST['id']) && isset($_REQUEST['tournament_id']) && !isset($_REQUEST['firstRoundGames']) && !isset($_REQUEST['semisGames']) && !isset($_REQUEST['finalGame'])) {
    echo getAllGamesInTournament($conn, $_REQUEST['tournament_id']);
}

else if ($_SERVER['REQUEST_METHOD'] == 'GET' && !isset($_REQUEST['id']) && isset($_REQUEST['tournament_id']) && isset($_REQUEST['firstRoundGames']) && !isset($_REQUEST['semisGames']) && !isset($_REQUEST['finalGame'])) {
    echo getFirstRoundGames($conn, $_REQUEST['tournament_id']);
}

else if ($_SERVER['REQUEST_METHOD'] == 'GET' && !isset($_REQUEST['id']) && isset($_REQUEST['tournament_id']) && !isset($_REQUEST['firstRoundGames']) && isset($_REQUEST['semisGames']) && !isset($_REQUEST['finalGame'])) {
    echo getSemifinalsGames($conn, $_REQUEST['tournament_id']);
}

else if ($_SERVER['REQUEST_METHOD'] == 'GET' && !isset($_REQUEST['id']) && isset($_REQUEST['tournament_id']) && !isset($_REQUEST['firstRoundGames']) && !isset($_REQUEST['semisGames']) && isset($_REQUEST['finalGame'])) {
    echo getFinalGame($conn, $_REQUEST['tournament_id']);
}

else if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    echo createGame($conn);
}

else if ($_SERVER['REQUEST_METHOD'] == 'PUT' && isset($_REQUEST['id'])) {
    echo updateGame($conn, $_REQUEST['id']);    
}

else if ($_SERVER['REQUEST_METHOD'] == 'DELETE' && isset($_REQUEST['id'])) {
    echo deleteGame($conn, $_REQUEST['id']);    
}

else {
    echo json_encode(array('status' => 'error', 'code' => 'Invalid request'));
}
?>