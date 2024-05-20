<?php

function getTournaments($conn) {
    $q = "SELECT * FROM tournaments";
    $result = mysqli_query($conn, $q);
    $empresas = array();
    while ($row = mysqli_fetch_assoc($result)) {
        $empresas[] = $row;
    }
    header('Content-Type: application/json');
    return json_encode($empresas);
}

?>