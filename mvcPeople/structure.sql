CREATE DATABASE people;

USE people;

CREATE TABLE `users` (
  `dni` VARCHAR(9) NOT NULL,
  `name` VARCHAR(40) NOT NULL,
  `email` VARCHAR(40) NOT NULL,
  `password` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`dni`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

