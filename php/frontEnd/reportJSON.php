<?php 

if($_GET['success'] === "true"){

    $formArr = array("nome" => $_GET['fname'], "turno" => $_GET['fturno'], "serie" => $_GET['fserie'], "curso" => $_GET['fcurso'], "componente" => $_GET['fcomponente'], "comment" => $_GET['fcomment']);
    echo json_encode($formArr);

}

?>