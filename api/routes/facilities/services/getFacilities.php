<?php 

function getFacilities($conn) {
    $q = "SELECT * FROM FACILITIES";
    $result = mysqli_query($conn,$q);

    $facilities = array();

    while ($facilitie = mysqli_fetch_assoc($result)) {
        $facilities[] = $facilitie;
    }

    header("Content-Type: application/json");
    return json_encode($facilities);
}

?>