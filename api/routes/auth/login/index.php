<?php

include "../../../db/connection.php";

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $data = json_decode(file_get_contents("php://input"), true);
    $email = $data['email'];
    $password = $data['password']; //Se necesita el md5 pero hay que revisar el script.sql para que las password esten en md5

    $q = "SELECT * FROM PEOPLE WHERE email = '$email' AND password = '$password'";
    
    $result = mysqli_query($conn, $q);
    
    if (mysqli_num_rows($result) > 0) {

        $user = mysqli_fetch_assoc($result);
    }

   /*  header("Content-Type: application/json"); */
    echo json_encode($user);
}
?>