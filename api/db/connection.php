<?php
header("Access-Control-Allow-Origin: http://localhost:5173"); 
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization"); 
/*
if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    header("HTTP/1.1 200 OK");
    exit;
}*/

if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    header("HTTP/1.1 200 OK");
    exit;
}

// Manejo de solicitudes OPTIONS (preflight)
if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    http_response_code(204); // No Content
    exit();
}

$db_hostname = "localhost";
$db_username = "root";
$db_password = "";
$db_database = "itbclub";

$conn = mysqli_connect($db_hostname, $db_username, $db_password, $db_database);

if (mysqli_errno($conn)) {
    echo "ERROR al connectar-se amb la base de dades";
    die();
}
?>