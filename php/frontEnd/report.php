<?php

require_once '../backEnd/DbConnect/dbConnect.php';
$success = false;
$error = false;
$name;
$curso = "";
$serie = "";
$turno  = "";
$componente = "";
$comment;

    if (isset($_POST['btn-send'])){

        $name = trim($_POST['inputName']);
        $curso = @$_POST['selectCurso'];
        $serie = @$_POST['selectSerie'];
        $turno = @$_POST['selectTurno'];
        $componente = @$_POST['selectComponente'];
        $comment = trim(@$_POST['inputComment']);

        // echo "name: ". $name. " <br> ";
        // echo "turno: ".$turno . " <br> ";
        // echo "saerie: ".$serie . " <br> ";
        // echo "curso: ".$curso . " <br> ";
        // echo "componente: ".$componente . " <br> ";
        // echo "comentario: ".$comment . " <br> ";

        if($name === "" || empty($curso) || empty($serie) || empty($turno) || empty($componente) || $comment === ""){
            $error = true;
            $errorCode = 202;
            // echo "Error: " . $errorCode;
        } else {
            if($report->saveReport($name, $curso, $serie, $turno, $componente, $comment)){
                $success = true;
            } else {
                $error = true;
                $errorCode = 202;
            }
        }
    }

    require_once '../backEnd/dbQuery/selectData.php';

?>

<!DOCTYPE html>
<html lang="pt-br" class="has-offscreen">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="../../css/pageStyle/reportStyle.css" media="screen">
    <link rel="stylesheet" href="../../css/componentsStyle/inputStyle.css" media="screen">
    <link rel="stylesheet" href="../../css/componentsStyle/selectStyle.css" media="screen">
    <link rel="stylesheet" href="../../css/componentsStyle/buttonStyle.css" media="screen">
    
    <title>Relatório do Bimestre</title>

</head>
<body>
    <header>
        <div class="header-top" id="header-top">
            <div class="header-wrapper">
                <div class="row basis-auto">
                    <div class="logo-col">
                        <a class="colored-logo-link logo-link" id="colored-logo" href="#">
                            <img src="../../img/Icons-Logos/CA-CPS-LOGOS-COLORIDO.png">
                        </a>
                        <a class="white-logo-link logo-link" id="white-logo" href="#">
                            <img src="../../img/Icons-Logos/CA-CPS-LOGOS.png">
                        </a>
                    </div>
                    <div class="menu-col">
                            <nav class="menu-container row">
                                <ul class="main-menu">
                                    <li>
                                        <a class="nav-item">Sobre</a>
                                    </li>
                                    <li>
                                        <a class="nav-item">Blog</a>
                                    </li>
                                    <li>
                                        <a class="nav-item">Fale Conosco</a>
                                    </li>
                                    <li>
                                        <a class="nav-item">NSA</a>
                                    </li>
                                </ul>
                            </nav>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <main class=site>
        <div class="bg-header-wrapper">
            <div class="header-homepage color-overlay" data-parallax-depth="20">
                <div class="header-description">
                    <div class="row header-description-row">
                        <div class="header-content">
                            <div class="align-holder">
                                <h1 class="hero-title">Relatório do Bimestre</h1>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="page-content">
                <div class="content">
                    <div class="form">
                        <form method="POST">
                            <?php if($error === true){ ?><div class="error-text-div"><span>Informe corretamente todas as informações</span></div><?php }?>
                            <?php if($success === true){ ?><div class="success-text-div"><span>Relatório enviado com Sucesso!</span></div><?php }?>
                            <div class="input-div">
                                <input type="text" id="inputName" class="inputClass" name="inputName" autocomplete="off" placeholder=" " value="<?php if($error === true || $success === true){ echo $name;} ?>">
                                <label for="inputName" class="placeholder-input">Nome Completo</label>
                            </div>

                            <div class="select-class">
                            <h4 class="h4Select">Selecione o seu Turno: </h4>
                                <div class="custom-select">
                                    <select class=" selectClass select01" name="selectTurno" id="selectTurnoId" title="selectTurno">
                                        <option value="<?php echo $report->inptValControl($turnoData, $turno, 1, $error, $success); ?>" for="selectTurnoId" selected hidden id="place-select"><?php echo $report->inptValControl($turnoData, $turno, 2, $error, $success); ?></option>
                                        <?php 
                                        foreach($turnoData as $key => $value){ ?>
                                            <option for="selectTurnoId" value="<?php echo $value['0']; ?>"><?php echo $value['1'] ?></option>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>
                            <div class="select-class">
                            <h4 class="h4Select">Selecione a sua Série: </h4>
                                <div class="custom-select">
                                    <select class=" selectClass select01" name="selectSerie" id="selectSerieId" title="selectSerie">
                                        <option value="<?php echo $report->inptValControl($serieData, $serie, 1, $error, $success); ?>" selected hidden id="place-select"><?php echo $report->inptValControl($serieData, $serie, 2, $error, $success); ?></option>
                                        <?php 
                                        foreach($serieData as $key => $value){ ?>
                                            <?php if($value['0'] < 4){ ?><option for="selectSerieId" value="<?php echo $value['0']; ?>"><?php echo $value['1'] ?></option> <?php } ?>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>
                            <div class="select-class">
                            <h4 class="h4Select">Selecione o seu Curso: </h4>
                                <div class="custom-select">
                                    <select class=" selectClass select01" name="selectCurso" id="selectCursoId" title="selectCurso">
                                        <option value="<?php echo $report->inptValControl($cursoData, $curso, 1, $error, $success); ?>" selected hidden id="place-select"><?php echo $report->inptValControl($cursoData, $curso, 2, $error, $success); ?></option>
                                        <?php foreach($cursoData as $key => $value){ ?>
                                            <option for="selectCursoId" value="<?php echo $value['0']; ?>"><?php echo $value['1'] ?></option>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>
                            <div class="select-class">
                            <h4 class="h4Select">Selecione o componente curricular: </h4>
                                <div class="custom-select">
                                    <select class=" selectClass select01" name="selectComponente" id="selectComponenteId" title="selectComponente">
                                        <option value="<?php echo $report->inptValControl($componenteData, $componente, 1, $error, $success); ?>" selected hidden id="place-select"><?php echo $report->inptValControl($componenteData, $componente, 2, $error, $success); ?></option>
                                        
                                    </select>
                                </div>
                            </div>
                            <div class="input-div">
                                <textarea name="inputComment" id="inputCommentId" class="textarea" placeholder=" "><?php if($error === true || $success === true){ echo $comment;}?></textarea>
                                <label for="inputCommentId" class="placeholder-input">Comentário</label>
                            </div>
                            <div class="button-div">
                                <button type="submit" name="btn-send">Enviar</button>
                            </div>
                            
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </main>
    
    <div id="dom-error-target" style="display: none;">
        <?php if($error === true && $errorCode === 202){

            echo htmlspecialchars($errorCode);

        } ?>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" src="../../js/formControl.js"></script>
    <script type="text/javascript" src="../../js/select.js"></script>
    <script type="text/javascript" src="../../js/style.js"></script>
    <script type="text/javascript" src="../../js/errorControl.js"></script>
</body>
</html>