<?php
header("Access-Control-Allow-Origin: *"); 
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization"); 

if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    header("HTTP/1.1 200 OK");
    exit;
}
/*
if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    http_response_code(204); 
    exit();
}*/

$db_hostname = "sql7.freemysqlhosting.net";
$db_username = "sql7709574";
$db_password = "BXimbBLPlM";
$db_database = "sql7709574";
$db_port = 3306;

$conn = new mysqli($db_hostname, $db_username, $db_password, $db_database, $db_port);


if (mysqli_errno($conn)) {
    echo "ERROR al connectar-se amb la base de dades";
    die();
}
?>