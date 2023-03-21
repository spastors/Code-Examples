<?php

require_once 'Model/userModel.php';

class userController
{
    private $userModel;

    public function __construct($connection)
    {
        $this->userModel = new userModel($connection);
    }

    public function showView()
    {
        $data = $this->userModel->listUsers();
        require_once('View/userView.php');
    }

    public function processDataForm()
    {
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $dni = strtoupper($_POST['dni']);
            $name = $_POST['name'];
            $email = $_POST['email'];
            $password = $_POST['password'];
            $this->userModel->createEditUser($dni, $name, $email, $password);
            header('Location: index.php');
            exit();
        } else {
            header('Location: index.php');
            exit();
        }
    }

}