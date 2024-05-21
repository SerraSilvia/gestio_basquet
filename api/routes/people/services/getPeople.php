<?php

function getPeople($conn) {
    $q = "SELECT * FROM people";
    $result = mysqli_query($conn, $q);

    $peoples = array();

    while ($people = mysqli_fetch_assoc($result)) {
        $peoples[] = $people;
    }

    header("Content-Type: application/json");
    return json_encode($peoples);
}

?>