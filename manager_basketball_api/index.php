<?php
/*Entry point de backend, código de pruba debajo*/
    $teams = array(
        array("id" => 1, "name" => "Equipo 001", "categoria" => "juvenil"),
        array("id" => 2, "name" => "Equipo 002", "categoria" => "juvenil"),
        array("id" => 3, "name" => "Equipo 003", "categoria" => "senior"),
        array("id" => 4, "name" => "Equipo 004", "categoria" => "profesional")
    );
    echo json_encode($teams);
    die;
?>