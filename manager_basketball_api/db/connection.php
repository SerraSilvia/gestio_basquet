<?php

$db_hostname = "localhost";
$db_username = "root";
$db_password = "root";
$db_database = "sports_management";

$conn = mysqli_connect($db_hostname, $db_username, $db_password, $db_database);

if (mysqli_errno($conn)) {
    echo "ERROR al connectar-se amb la base de dades";
    die();
}

?>