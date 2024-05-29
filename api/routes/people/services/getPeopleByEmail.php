<?php

function getPeopleByEmail($conn, $email) {
    $q = "SELECT * FROM PEOPLE WHERE email='$email'";
    $result = mysqli_query($conn, $q);

    $peoples = array();

    while ($people = mysqli_fetch_assoc($result)) {
        $peoples[] = $people;
    }

    header("Content-Type: application/json");
    return json_encode($peoples);
}

?>