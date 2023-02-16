-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Biblioteca
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Biblioteca
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Biblioteca` DEFAULT CHARACTER SET utf8 ;
USE `Biblioteca` ;

-- -----------------------------------------------------
-- Table `Biblioteca`.`Autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Biblioteca`.`Autor` (
  `ID` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `código_UNIQUE` (`ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Biblioteca`.`Libro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Biblioteca`.`Libro` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `paginas` INT(10) NOT NULL,
  `ISBN` INT(45) NOT NULL,
  `editorial` VARCHAR(45) NOT NULL,
  `titulo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ISBN_UNIQUE` (`ISBN` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Biblioteca`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Biblioteca`.`Usuario` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Biblioteca`.`Ejemplar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Biblioteca`.`Ejemplar` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `ubicacion` VARCHAR(45) NOT NULL,
  `Libro_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  INDEX `fk_Ejemplar_Libro1_idx` (`Libro_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Ejemplar_Libro1`
    FOREIGN KEY (`Libro_ID`)
    REFERENCES `Biblioteca`.`Libro` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Biblioteca`.`Autor_tiene_Libro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Biblioteca`.`Autor_tiene_Libro` (
  `Autor_ID` INT NOT NULL,
  `Libro_ID` INT NOT NULL,
  PRIMARY KEY (`Autor_ID`, `Libro_ID`),
  INDEX `fk_Autor_has_Libro_Libro1_idx` (`Libro_ID` ASC) VISIBLE,
  INDEX `fk_Autor_has_Libro_Autor_idx` (`Autor_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Autor_has_Libro_Autor`
    FOREIGN KEY (`Autor_ID`)
    REFERENCES `Biblioteca`.`Autor` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Autor_has_Libro_Libro1`
    FOREIGN KEY (`Libro_ID`)
    REFERENCES `Biblioteca`.`Libro` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Biblioteca`.`Usuario_tiene_Ejemplar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Biblioteca`.`Usuario_tiene_Ejemplar` (
  `Usuario_ID` INT NOT NULL,
  `Ejemplar_ID` INT NOT NULL,
  `fecha_prest` DATE NOT NULL,
  `fecha_devol` DATE NULL,
  PRIMARY KEY (`Usuario_ID`, `Ejemplar_ID`),
  INDEX `fk_Usuario_has_Ejemplar_Ejemplar1_idx` (`Ejemplar_ID` ASC) VISIBLE,
  INDEX `fk_Usuario_has_Ejemplar_Usuario1_idx` (`Usuario_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Usuario_has_Ejemplar_Usuario1`
    FOREIGN KEY (`Usuario_ID`)
    REFERENCES `Biblioteca`.`Usuario` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_has_Ejemplar_Ejemplar1`
    FOREIGN KEY (`Ejemplar_ID`)
    REFERENCES `Biblioteca`.`Ejemplar` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Biblioteca`.`Fotos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Biblioteca`.`Fotos` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `carpeta` VARCHAR(45) NULL,
  `fecha` DATE NULL,
  `Libro_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  INDEX `fk_Fotos_Libro1_idx` (`Libro_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Fotos_Libro1`
    FOREIGN KEY (`Libro_ID`)
    REFERENCES `Biblioteca`.`Libro` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;