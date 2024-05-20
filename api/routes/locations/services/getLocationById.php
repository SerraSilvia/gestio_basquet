<?php

function getLocationById($conn, $id) {
    $q = "SELECT * FROM locations WHERE id = '$id'";
    $result = mysqli_query($conn, $q);

    $locations = array();

    while ($location = mysqli_fetch_assoc($result)) {
        $locations[] = $location;
    }

    header("Content-Type: application/json");
    return json_encode($locations);
}

?>