-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`proveedor` (
  `id_proveedor` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NULL,
  `telefono` VARCHAR(20) NULL,
  `fax` VARCHAR(20) NULL,
  `nif` VARCHAR(20) NULL,
  `calle` VARCHAR(100) NULL,
  `numero` VARCHAR(10) NULL,
  `piso` VARCHAR(10) NULL,
  `puerta` VARCHAR(10) NULL,
  `ciudad` VARCHAR(100) NULL,
  `codigo_postal` VARCHAR(10) NULL,
  `pais` VARCHAR(50) NULL,
  PRIMARY KEY (`id_proveedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`gafas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`gafas` (
  `id_gafas` INT NOT NULL AUTO_INCREMENT,
  `marca` VARCHAR(100) NULL,
  `tipo-montura` VARCHAR(50) NULL,
  `color-montura` VARCHAR(50) NULL,
  `precio` DECIMAL(10,2) NULL,
  `id_proveedor` INT NULL,
  `graduacion_izquierda` DECIMAL(4,2) NULL,
  `graduacion_derecha` DECIMAL(4,2) NULL,
  `color_vidrio_izquierdo` VARCHAR(50) NULL,
  `color_vidrio_derecho` VARCHAR(50) NULL,
  PRIMARY KEY (`id_gafas`),
  INDEX `fk_gafas_proveedor_idx` (`id_proveedor` ASC) VISIBLE,
  CONSTRAINT `fk_gafas_proveedor`
    FOREIGN KEY (`id_proveedor`)
    REFERENCES `mydb`.`proveedor` (`id_proveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cliente` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NULL,
  `direccion` VARCHAR(150) NULL,
  `telefono` VARCHAR(20) NULL,
  `email` VARCHAR(100) NULL,
  `fecha_registro` DATE NULL,
  `cliente_recomendador` INT NULL,
  PRIMARY KEY (`id_cliente`),
  INDEX `fk_cliente_recomendador_idx` (`cliente_recomendador` ASC) VISIBLE,
  CONSTRAINT `fk_cliente_recomendador`
    FOREIGN KEY (`cliente_recomendador`)
    REFERENCES `mydb`.`cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`empleado` (
  `id_empleado` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NULL,
  `telefono` VARCHAR(20) NULL,
  `email` VARCHAR(100) NULL,
  PRIMARY KEY (`id_empleado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`venta` (
  `id_venta` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NULL,
  `id_cliente` INT NULL,
  `id_empleado` INT NULL,
  `id_gafas` INT NULL,
  PRIMARY KEY (`id_venta`),
  INDEX `fk_venta_cliente_idx` (`id_cliente` ASC) VISIBLE,
  INDEX `fk_venta_empleado_idx` (`id_empleado` ASC) VISIBLE,
  INDEX `fk_venta_gafas_idx` (`id_gafas` ASC) VISIBLE,
  CONSTRAINT `fk_venta_cliente`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `mydb`.`cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_venta_empleado`
    FOREIGN KEY (`id_empleado`)
    REFERENCES `mydb`.`empleado` (`id_empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_venta_gafas`
    FOREIGN KEY (`id_gafas`)
    REFERENCES `mydb`.`gafas` (`id_gafas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
