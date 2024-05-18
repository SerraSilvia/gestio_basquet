<?php

include '../db/connection.php';

include './services/getCommentsByPlayer.php';
include './services/getCommentById.php';
include './services/createComment.php';
include './services/deleteComment.php';

if ($_SERVER['REQUEST_METHOD'] == 'GET' && isset($_REQUEST['person_id']) && !isset($_REQUEST['id'])) {
    echo getCommentsByPlayer($conn, $_REQUEST['person_id']); 
}

else if ($_SERVER['REQUEST_METHOD'] == 'GET' && isset($_REQUEST['person_id']) && isset($_REQUEST['id'])) {
    echo getCommentById($conn, $_REQUEST['id']);
}

else if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    echo createComment($conn);
}

else if ($_SERVER['REQUEST_METHOD'] == 'DELETE' && isset($_REQUEST['id'])) {
    echo deleteComment($conn, $_REQUEST['id']);
}

else {
    echo json_encode(array('status' => 'error', 'code' => 'Invalid request'));
}

?>