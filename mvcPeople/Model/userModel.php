<?php

class userModel
{
    private $connection;

    public function __construct($connection)
    {
        $this->connection = $connection;
    }

    public function existsUser($dni)
    {
        $sql = "SELECT * FROM users WHERE dni = ?";
        $stmt = $this->connection->prepare($sql);
        $stmt->bind_param("s", $dni);
        $stmt->execute();
        $result = $stmt->get_result();
        $stmt->close();
        return $result->num_rows;
    }

    public function createEditUser($dni, $name, $email, $password)
    {
        $this->existsUser($dni) ?
            $sql = "UPDATE users SET name = ?, email = ?, password = ? WHERE dni = ?" :
            $sql = "INSERT INTO users (name, email, password, dni) VALUES (?, ?, ?, ?)";

        $stmt = $this->connection->prepare($sql);
        $stmt->bind_param("ssss", $name, $email, $password, $dni);
        $stmt->execute();
        $stmt->close();
    }

    public function listUsers()
    {
        $sql = "SELECT * FROM users";
        $stmt = $this->connection->prepare($sql);
        $stmt->execute();
        $result = $stmt->get_result();
        $stmt->close();
        return $result->fetch_all(MYSQLI_ASSOC);
    }
}