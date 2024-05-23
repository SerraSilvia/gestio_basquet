<?php
header("Access-Control-Allow-Origin: *"); 
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization"); 

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