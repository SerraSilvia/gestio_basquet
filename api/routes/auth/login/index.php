<?php

include "../../../db/connection.php";

if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    $data = json_decode(file_get_contents("php://input"), true);
    $email = $data['email'];
    $password = md5($data['password']);
    $user_type = $data['user_type'];

    $q = "SELECT * FROM people WHERE email = '$email' AND password = '$password'";
    $result = mysqli_query($conn, $q);

    $user = array();
    if (mysqli_num_rows($result) > 0) {
        $user['token'] = base64_encode(random_bytes(32));

        $data = mysqli_fetch_assoc($result);
        $user['auth_level'] = $data['user_type'];
    }

    header("Content-Type: application/json");
    echo json_decode($user);
}
?>