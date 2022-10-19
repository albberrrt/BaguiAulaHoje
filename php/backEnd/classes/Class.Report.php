<?php

class Report{

    private $db;

    function __construct($conn){
        $this -> db = $conn;
    }

    public function saveReport($name, $curso, $serie, $turno, $componente, $comment){
        try{

            $stmt = $this->db->prepare("INSERT INTO `tbRelatorio` (`idRelatorio`, `turno`, `curso`, `serie`, `componente`, `aluno`, `comentario`) 
            VALUES (null, :turno, :curso, :serie, :componente, :aluno, :comentario)");
            $stmt->bindParam(":aluno", $name);
            $stmt->bindParam(":turno", $turno);
            $stmt->bindParam(":serie", $serie);
            $stmt->bindParam(":curso", $curso);
            $stmt->bindParam(":componente", $componente);
            $stmt->bindParam(":comentario", $comment);
            $stmt->execute();

            return $stmt;

        } catch(PDOException $e){
            echo $e->getMessage();
        }
    }

    public function inptValControl($data, $inpt, $val, $error, $success){
        if($val == 1){
            if($error == true && $inpt != "" || $success == true){
                return $data[$inpt - 1][0];
            } else {
                return "";
            }
        } else if($val== 2){
            if($error == true && $inpt != "" || $success == true){
                return $data[$inpt - 1][1];
            } else if($error == true && $inpt === ""){
                return "Selecione aqui";
            } else {
                return "Selecione aqui";
            }
        }
    }
    
}


?>