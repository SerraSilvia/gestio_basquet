<?php

function getPeopleByUserType($conn, $user_type) {
    $q = "SELECT * FROM people WHERE user_type='$user_type'";
    $result = mysqli_query($conn, $q);

    $peoples = array();

    while ($people = mysqli_fetch_assoc($result)) {
        $peoples[] = $people;
    }

    header("Content-Type: application/json");
    return json_encode($peoples);
}

?>