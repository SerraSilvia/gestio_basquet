<?php

include "../../db/connection.php";

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
    echo json_decode($user);
}
?>