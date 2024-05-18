<?php

function updateTeam($conn, $id) {
    $data = json_decode(file_get_contents('php://input'), true);

    $name = $data['name'];
    $location_id = $data['addlocation_idress'];
    $category = $data['category'];
    $total_score = $data['total_score'];

    $q = "UPDATE teams SET name='$name', location_id='$location_id', category='$category', total_score='$total_score' WHERE id='$id'";
    $result = mysqli_query($conn, $q);

    if ($result) {
        $response = array('status' => 'success');
    } else {
        $response = array('status' => 'error');
    }

    header('Content-Type: application/json');
    return json_encode($response);
}

?>