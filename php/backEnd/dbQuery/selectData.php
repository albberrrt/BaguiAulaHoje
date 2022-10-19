<?php

require_once '../backEnd/DbConnect/dbConnect.php';


    $stmt = "SELECT * FROM tbCurso";
    $cursos = $conn->query($stmt);
    $cursoData = $cursos->fetchAll();

    $stmt = "SELECT * FROM tbTurno";
    $turnos = $conn->query($stmt);
    $turnoData = $turnos->fetchAll();

    $stmt = "SELECT * FROM tbComponente";
    $componentes= $conn->query($stmt);
    $componenteData = $componentes->fetchAll();

    $stmt = "SELECT * FROM tbSerie";
    $series = $conn->query($stmt);
    $serieData = $series->fetchAll();

    


?>