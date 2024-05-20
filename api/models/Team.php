<?php

class Team {
    // Atributos
    private $id;
    private $nom;
    private $sede_id;
    private $categoria;

    // Constructor
    public function __construct($id, $nom, $sede_id, $categoria) {
        $this->id = $id;
        $this->nom = $nom;
        $this->sede_id = $sede_id;
        $this->categoria = $categoria;
    }


    // Método toString no lo ponemos porque la api no necesita un toString. La api devuelve los datos

    // Getters y Setters

    // Getter para el ID
    public function getId() {
        return $this->id;
    }

    // Setter para el ID
    public function setId($id) {
        $this->id = $id;
    }

    // Getter para el nombre
    public function getNom() {
        return $this->nom;
    }

    // Setter para el nombre
    public function setNom($nom) {
        $this->nom = $nom;
    }

    // Getter para el ID de la sede
    public function getSedeId() {
        return $this->sede_id;
    }

    // Setter para el ID de la sede
    public function setSedeId($sede_id) {
        $this->sede_id = $sede_id;
    }

    // Getter para la categoría
    public function getCategoria() {
        return $this->categoria;
    }

    // Setter para la categoría
    public function setCategoria($categoria) {
        $this->categoria = $categoria;
    }
}

?>

