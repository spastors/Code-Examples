<?php

require_once 'Controller/userController.php';

try {
    $connection = new mysqli('localhost', 'root', '', 'people');
} catch (mysqli_sql_exception $error) {
    die('Connect failed: <br />' . $error->getMessage());
}

// // Capturar sólo posibles errores que se producen durante la conexión con el servidor de MySQL
// $connection = new mysqli('localhost', 'root', '', 'people');
// if ($connection->connect_errno) {
//     die('Connect failed: <br />' . $connection->connect_error);
// }

$userController = new userController($connection);

$action = isset($_GET['action']) && $_GET['action'] === 'createEditUser' ?
    $userController->processDataForm() :
    $userController->showView();

$connection->close();