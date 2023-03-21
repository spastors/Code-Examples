CREATE DATABASE invoicing;

USE invoicing;

-- -- Invoices -- -- 
CREATE TABLE `invoices` (
    `id` INT auto_increment NOT NULL,
    `idPayment` INT NOT NULL,
    `purchaseDate` INT NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

CREATE TABLE `invoiceDetails` (
    `id` INT auto_increment NOT NULL,
    `idInvoice` INT NOT NULL,
    `idSeller` INT NOT NULL,
    `idCustomer` INT NOT NULL,
    `idItem` INT NOT NULL,
    `numberItems` INT NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- -- Payments -- -- 
CREATE TABLE `paymentInformation` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `idPaymentType` INT NOT NULL,
    `cardNumber` VARCHAR(30),
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

CREATE TABLE `paymentTypes` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- -- Sellers -- -- 
CREATE TABLE `sellers` (
    `id` INT auto_increment NOT NULL,
    `idRank` INT NOT NULL,
    `name` VARCHAR(30) NOT NULL,
    `surnames` VARCHAR(60) NOT NULL,
    `email` VARCHAR(40) NOT NULL UNIQUE,
    `birthday` INT NOT NULL,
    `phone` VARCHAR(20),
    `recruitmentDate` INT NOT NULL,
    `salary` DECIMAL(8, 2) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

CREATE TABLE `sellerRanks` (
    `id` INT auto_increment NOT NULL,
    `name` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- -- Customers -- -- 
CREATE TABLE `customers` (
    `id` INT auto_increment NOT NULL,
    `name` VARCHAR(30) NOT NULL,
    `surnames` VARCHAR(60) NOT NULL,
    `email` VARCHAR(40) NOT NULL UNIQUE,
    `birthday` INT NOT NULL,
    `phone` VARCHAR(20),
    `zipCode` INT NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- -- Items -- -- 
CREATE TABLE `items` (
    `id` INT auto_increment NOT NULL,
    `name` VARCHAR(50) NOT NULL,
    `description` VARCHAR(200) NOT NULL,
    `idBrand` INT NOT NULL,
    `idItemCategory` INT NOT NULL,
    `idColor` INT NOT NULL,
    `idSize` INT NOT NULL,
    `genre` ENUM('M', 'F'),
    `price` DECIMAL(8, 2) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

CREATE TABLE `sports` (
    `id` INT auto_increment NOT NULL,
    `name` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

CREATE TABLE `itemSports` (
    `id` INT auto_increment NOT NULL,
    `idSport` INT NOT NULL,
    `idItem` INT NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

CREATE TABLE `brands` (
    `id` INT auto_increment NOT NULL,
    `name` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

CREATE TABLE `itemCategories` (
    `id` INT auto_increment NOT NULL,
    `name` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

CREATE TABLE `colors` (
    `id` INT auto_increment NOT NULL,
    `name` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

CREATE TABLE `sizes` (
    `id` INT auto_increment NOT NULL,
    `size` VARCHAR(10) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- -- Relationships between tables -- --
ALTER TABLE
    `invoices`
ADD
    CONSTRAINT `invoices_idPayment` FOREIGN KEY (`idPayment`) REFERENCES `paymentInformation` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE
    `invoiceDetails`
ADD
    CONSTRAINT `invoiceDetails_idInvoice` FOREIGN KEY (`idInvoice`) REFERENCES `invoices` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
ADD
    CONSTRAINT `invoiceDetails_idSeller` FOREIGN KEY (`idSeller`) REFERENCES `sellers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
ADD
    CONSTRAINT `invoiceDetails_idCustomer` FOREIGN KEY (`idCustomer`) REFERENCES `customers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
ADD
    CONSTRAINT `invoiceDetails_idItem` FOREIGN KEY (`idItem`) REFERENCES `items` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE
    `paymentInformation`
ADD
    CONSTRAINT `paymentInformation_idPaymentType` FOREIGN KEY (`idPaymentType`) REFERENCES `paymentTypes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE
    `sellers`
ADD
    CONSTRAINT `sellers_idRank` FOREIGN KEY (`idRank`) REFERENCES `sellerRanks` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE
    `items`
ADD
    CONSTRAINT `items_idBrand` FOREIGN KEY (`idBrand`) REFERENCES `brands` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
ADD
    CONSTRAINT `items_idItemCategory` FOREIGN KEY (`idItemCategory`) REFERENCES `itemCategories` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
ADD
    CONSTRAINT `items_idColor` FOREIGN KEY (`idColor`) REFERENCES `colors` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
ADD
    CONSTRAINT `items_idSize` FOREIGN KEY (`idSize`) REFERENCES `sizes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE
    `itemSports`
ADD
    CONSTRAINT `itemSports_idSport` FOREIGN KEY (`idSport`) REFERENCES `sports` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
ADD
    CONSTRAINT `itemSports_idItem` FOREIGN KEY (`idItem`) REFERENCES `items` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;