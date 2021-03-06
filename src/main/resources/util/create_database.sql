-- MySQL Script generated by MySQL Workbench
-- 03/21/17 19:35:51
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema chaves
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema chaves
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `chaves` DEFAULT CHARACTER SET utf8 ;
USE `chaves` ;

-- -----------------------------------------------------
-- Table `chaves`.`instituto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chaves`.`instituto` (
  `idInstituto` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`idInstituto`))
  ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `chaves`.`departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chaves`.`departamento` (
  `idDepartamento` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `idInstituto` INT NOT NULL,
  PRIMARY KEY (`idDepartamento`, `idInstituto`),
  INDEX `fk_departamento_instituto1_idx` (`idInstituto` ASC),
  CONSTRAINT `fk_departamento_instituto1`
  FOREIGN KEY (`idInstituto`)
  REFERENCES `chaves`.`instituto` (`idInstituto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
  ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `chaves`.`aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chaves`.`aluno` (
  `idAluno` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `matricula` VARCHAR(9) NULL,
  `email` VARCHAR(45) NULL,
  `idDepartamento` INT NOT NULL,
  PRIMARY KEY (`idAluno`, `idDepartamento`),
  INDEX `fk_aluno_departamento_idx` (`idDepartamento` ASC),
  CONSTRAINT `fk_aluno_departamento`
  FOREIGN KEY (`idDepartamento`)
  REFERENCES `chaves`.`departamento` (`idDepartamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
  ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `chaves`.`laboratorio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chaves`.`laboratorio` (
  `idLaboratorio` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `numeroSala` VARCHAR(10) NULL,
  PRIMARY KEY (`idLaboratorio`))
  ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `chaves`.`chave`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chaves`.`chave` (
  `idChave` INT NOT NULL,
  `descricao` VARCHAR(45) NULL,
  `idLaboratorio` INT NOT NULL,
  PRIMARY KEY (`idChave`, `idLaboratorio`),
  INDEX `fk_chave_laboratorio1_idx` (`idLaboratorio` ASC),
  CONSTRAINT `fk_chave_laboratorio1`
  FOREIGN KEY (`idLaboratorio`)
  REFERENCES `chaves`.`laboratorio` (`idLaboratorio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
  ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `chaves`.`aluno_has_chave`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chaves`.`aluno_has_chave` (
  `idAluno` INT NOT NULL,
  `idChave` INT NOT NULL,
  `dataHoraPosseChave` DATETIME NULL,
  `dataHoraEntregaChave` DATETIME NULL,
  PRIMARY KEY (`idAluno`, `idChave`),
  INDEX `fk_aluno_has_chave_chave1_idx` (`idChave` ASC),
  INDEX `fk_aluno_has_chave_aluno1_idx` (`idAluno` ASC),
  CONSTRAINT `fk_aluno_has_chave_aluno1`
  FOREIGN KEY (`idAluno`)
  REFERENCES `chaves`.`aluno` (`idAluno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_aluno_has_chave_chave1`
  FOREIGN KEY (`idChave`)
  REFERENCES `chaves`.`chave` (`idChave`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
  ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;