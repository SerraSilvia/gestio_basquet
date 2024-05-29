<?php 

function getFacilityByLocation($conn, $location_id) {
    $q = "SELECT * FROM FACILITIES WHERE location_id = '$location_id'";
    $result = mysqli_query($conn,$q);

    $facilities = array();

    while ($facilitie = mysqli_fetch_assoc($result)) {
        $facilities[] = $facilitie;
    }

    header("Content-Type: application/json");
    return json_encode($facilities);
}

?>