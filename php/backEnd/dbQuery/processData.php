<?php
    
    require_once '../DbConnect/dbConnect.php';

    if(isset($_POST['serie']) && isset($_POST['curso'])){
        $serie = $_POST['serie'];
        $curso = $_POST['curso'];

        $stmt = $conn->prepare("SELECT componenteId, componente FROM `tbcomponente` 
        WHERE componenteCurso = :curso AND componenteSerie = :serie 
        OR componenteCurso = 10 AND componenteSerie = 4");
        $stmt->bindParam(":serie", $serie);
        $stmt->bindParam(":curso", $curso);
        $stmt->execute();

        $data = $stmt->fetchAll();
        echo json_encode($data);
        
    }

?>