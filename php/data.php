<?php
header('Access-Control-Allow-Origin: *');
require_once './backEnd/DbConnect/dbConnect.php';

if(isset($_GET['n'])) {

    $name = $_GET['n'];
    $name = trim($name);

    $sql = $conn->prepare("SELECT
                            r.aluno,
                            r.comentario,
                            t.turno,
                            s.serie,
                            c.curso,
                            m.componente
                            FROM `tbrelatorio` r
                            INNER JOIN `tbturno` t
                                ON r.turno = t.idTurno
                            INNER JOIN `tbserie` s
                                ON r.serie = s.idSerie
                            INNER JOIN `tbcurso` c
                                ON r.curso = c.idCurso
                            INNER JOIN `tbcomponente` m
                                ON r.componente = m.componenteId
                            WHERE r.aluno = :aluno;
                                ");
    $sql->bindParam(":aluno", $name);
    $sql->execute();

    $data = $sql->fetchAll();

    echo json_encode($data);

}

?>