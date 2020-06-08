-- MySQL Script generated by MySQL Workbench
-- Sun Jun  7 22:01:21 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Warehouse_Project
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Warehouse_Project` ;

-- -----------------------------------------------------
-- Schema Warehouse_Project
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Warehouse_Project` DEFAULT CHARACTER SET utf8 ;
USE `Warehouse_Project` ;

-- -----------------------------------------------------
-- Table `Warehouse_Project`.`Drivers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Warehouse_Project`.`Drivers` ;

CREATE TABLE IF NOT EXISTS `Warehouse_Project`.`Drivers` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `age` INT NULL,
  `birth` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = '								';


-- -----------------------------------------------------
-- Table `Warehouse_Project`.`Companies`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Warehouse_Project`.`Companies` ;

CREATE TABLE IF NOT EXISTS `Warehouse_Project`.`Companies` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Warehouse_Project`.`Trucks`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Warehouse_Project`.`Trucks` ;

CREATE TABLE IF NOT EXISTS `Warehouse_Project`.`Trucks` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `drivers_id` INT NOT NULL,
  `capacity` DOUBLE NOT NULL,
  `companies_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Trucks_Drivers1_idx` (`drivers_id` ASC) VISIBLE,
  INDEX `fk_Trucks_Companies1_idx` (`companies_id` ASC) VISIBLE,
  CONSTRAINT `fk_Trucks_Drivers1`
    FOREIGN KEY (`drivers_id`)
    REFERENCES `Warehouse_Project`.`Drivers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Trucks_Companies1`
    FOREIGN KEY (`companies_id`)
    REFERENCES `Warehouse_Project`.`Companies` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Warehouse_Project`.`Routes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Warehouse_Project`.`Routes` ;

CREATE TABLE IF NOT EXISTS `Warehouse_Project`.`Routes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB
COMMENT = '	';


-- -----------------------------------------------------
-- Table `Warehouse_Project`.`Orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Warehouse_Project`.`Orders` ;

CREATE TABLE IF NOT EXISTS `Warehouse_Project`.`Orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NOT NULL,
  `routes_id` INT NOT NULL,
  `trucks_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `idOrders_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Orders_Routes1_idx` (`routes_id` ASC) VISIBLE,
  INDEX `fk_Orders_Trucks1_idx` (`trucks_id` ASC) VISIBLE,
  CONSTRAINT `fk_Orders_Routes1`
    FOREIGN KEY (`routes_id`)
    REFERENCES `Warehouse_Project`.`Routes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_Trucks1`
    FOREIGN KEY (`trucks_id`)
    REFERENCES `Warehouse_Project`.`Trucks` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Warehouse_Project`.`Product_Categories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Warehouse_Project`.`Product_Categories` ;

CREATE TABLE IF NOT EXISTS `Warehouse_Project`.`Product_Categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Warehouse_Project`.`Products`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Warehouse_Project`.`Products` ;

CREATE TABLE IF NOT EXISTS `Warehouse_Project`.`Products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `volume` DOUBLE NOT NULL,
  `due_date` DATETIME NOT NULL,
  `price` DOUBLE NOT NULL,
  `product_categories_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Products_produc_categories1_idx` (`product_categories_id` ASC) VISIBLE,
  CONSTRAINT `fk_Products_Product_Categories1`
    FOREIGN KEY (`product_categories_id`)
    REFERENCES `Warehouse_Project`.`Product_Categories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Warehouse_Project`.`Countries`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Warehouse_Project`.`Countries` ;

CREATE TABLE IF NOT EXISTS `Warehouse_Project`.`Countries` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Warehouse_Project`.`Cities`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Warehouse_Project`.`Cities` ;

CREATE TABLE IF NOT EXISTS `Warehouse_Project`.`Cities` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `countries_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Cities_Countries1_idx` (`countries_id` ASC) VISIBLE,
  CONSTRAINT `fk_Cities_Countries1`
    FOREIGN KEY (`countries_id`)
    REFERENCES `Warehouse_Project`.`Countries` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Warehouse_Project`.`Locations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Warehouse_Project`.`Locations` ;

CREATE TABLE IF NOT EXISTS `Warehouse_Project`.`Locations` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(45) NOT NULL,
  `number` VARCHAR(45) NOT NULL,
  `code` VARCHAR(45) NOT NULL,
  `cities_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Locations_Cities1_idx` (`cities_id` ASC) VISIBLE,
  CONSTRAINT `fk_Locations_Cities1`
    FOREIGN KEY (`cities_id`)
    REFERENCES `Warehouse_Project`.`Cities` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Warehouse_Project`.`Warehouses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Warehouse_Project`.`Warehouses` ;

CREATE TABLE IF NOT EXISTS `Warehouse_Project`.`Warehouses` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `locations_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Warehouses_Locations1_idx` (`locations_id` ASC) VISIBLE,
  CONSTRAINT `fk_Warehouses_Locations1`
    FOREIGN KEY (`locations_id`)
    REFERENCES `Warehouse_Project`.`Locations` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Warehouse_Project`.`Orders_Details`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Warehouse_Project`.`Orders_Details` ;

CREATE TABLE IF NOT EXISTS `Warehouse_Project`.`Orders_Details` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `total_volume` DOUBLE NOT NULL,
  `products_id` INT NOT NULL,
  `orders_id` INT NOT NULL,
  `warehouses_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Orders_Details_Products1_idx` (`products_id` ASC) VISIBLE,
  INDEX `fk_Orders_Details_Orders1_idx` (`orders_id` ASC) VISIBLE,
  INDEX `fk_Orders_Details_Warehouses1_idx` (`warehouses_id` ASC) VISIBLE,
  CONSTRAINT `fk_Orders_Details_Products1`
    FOREIGN KEY (`products_id`)
    REFERENCES `Warehouse_Project`.`Products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_Details_Orders1`
    FOREIGN KEY (`orders_id`)
    REFERENCES `Warehouse_Project`.`Orders` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_Details_Warehouses1`
    FOREIGN KEY (`warehouses_id`)
    REFERENCES `Warehouse_Project`.`Warehouses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Warehouse_Project`.`Phones`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Warehouse_Project`.`Phones` ;

CREATE TABLE IF NOT EXISTS `Warehouse_Project`.`Phones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `number` INT NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `drivers_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Phones_Drivers1_idx` (`drivers_id` ASC) VISIBLE,
  CONSTRAINT `fk_Phones_Drivers1`
    FOREIGN KEY (`drivers_id`)
    REFERENCES `Warehouse_Project`.`Drivers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
