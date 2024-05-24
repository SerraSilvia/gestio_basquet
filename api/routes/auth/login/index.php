<?php
/*
header("Access-Control-Allow-Origin: *"); // Asegúrate de que esto coincida con tu frontend
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

// Handle preflight OPTIONS request
if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    header("HTTP/1.1 200 OK");
    exit;
}
*/
include "../../../db/connection.php";



if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    $data = json_decode(file_get_contents("php://input"), true);
    $email = $data['email'];
    $password = md5($data['password']);

    $q = "SELECT * FROM PEOPLE WHERE email = '$email' AND password = '$password'";
    $result = mysqli_query($conn, $q);

    $user = array();
    if (mysqli_num_rows($result) > 0) {

        $user = mysqli_fetch_assoc($result);
    }

    header("Content-Type: application/json");
    echo json_encode($user);
}
?>