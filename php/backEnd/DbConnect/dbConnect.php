<?php

session_start();
require_once __DIR__.'/DBconfig.php';

try {
    $conn = new PDO("mysql:host=$host;dbname=$dbname", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET CHARACTER SET UTF8"));
    $conn -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $error) {
    die("Não foi possível se conectar ao banco de dados $dbname: " . $error->getMessage());
}


include_once 'C:\wamp64\www\BaguiAulaHoje\php\backEnd\classes/Class.Report.php';
$report = new Report($conn);

?>