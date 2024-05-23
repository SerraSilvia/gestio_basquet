<?php

function getLocations($conn) {
    $q = "SELECT * FROM LOCATIONS";
    $result = mysqli_query($conn, $q);

    $locations = array();

    while ($location = mysqli_fetch_assoc($result)) {
        $locations[] = $location;
    }

    header("Content-Type: application/json");
    return json_encode($locations);
}

?>