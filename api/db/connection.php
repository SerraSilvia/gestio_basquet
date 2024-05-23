<?php
// Agregar estos encabezados al principio de tus scripts PHP
header("Access-Control-Allow-Origin: *"); // Permitir solicitudes desde cualquier origen
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS"); // Permitir los métodos HTTP específicos
header("Access-Control-Allow-Headers: Content-Type, Authorization"); // Permitir los encabezados personalizados necesarios

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