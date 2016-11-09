-- MySQL Script generated by MySQL Workbench
-- 11/09/16 17:36:03
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema dsoutlet
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dsoutlet
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dsoutlet` DEFAULT CHARACTER SET utf8 ;
USE `dsoutlet` ;

-- -----------------------------------------------------
-- Table `dsoutlet`.`Endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dsoutlet`.`Endereco` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cidade` VARCHAR(45) NOT NULL,
  `estado` VARCHAR(45) NOT NULL,
  `numero` TINYINT(4) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dsoutlet`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dsoutlet`.`cliente` (
  `cpf` VARCHAR(14) NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `telefone` VARCHAR(13) NOT NULL,
  `email` VARCHAR(50) NULL DEFAULT NULL,
  `nascimento` DATE NOT NULL,
  `valorapagar` DECIMAL(5,2) NULL DEFAULT NULL,
  `parcelasrestantes` TINYINT(4) NULL DEFAULT NULL,
  `vencimento` DATE NULL DEFAULT NULL,
  `EnderecoId` INT NOT NULL,
  PRIMARY KEY (`cpf`, `EnderecoId`),
  INDEX `fk_cliente_Endereco1_idx` (`EnderecoId` ASC),
  CONSTRAINT `fk_cliente_Endereco1`
    FOREIGN KEY (`EnderecoId`)
    REFERENCES `dsoutlet`.`Endereco` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dsoutlet`.`loja`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dsoutlet`.`loja` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(30) NOT NULL,
  `endereco` VARCHAR(200) NOT NULL,
  `telefone` VARCHAR(13) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dsoutlet`.`produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dsoutlet`.`produto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `quantidade` SMALLINT(6) NOT NULL,
  `marca` VARCHAR(50) NOT NULL,
  `modelo` VARCHAR(50) NOT NULL,
  `tamanho` ENUM('PP', 'P', 'M', 'G', 'GG', 'XG', 'XXG', '36', '38', '40', '42', '44', '46', '48') NOT NULL,
  `precosaida` DECIMAL(5,2) NULL DEFAULT NULL,
  `precoentrada` DECIMAL(5,2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dsoutlet`.`funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dsoutlet`.`funcionario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `login` VARCHAR(30) NOT NULL,
  `senha` VARCHAR(30) NOT NULL,
  `acesso` ENUM('A', 'C') NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dsoutlet`.`venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dsoutlet`.`venda` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cpfcliente` VARCHAR(14) NULL DEFAULT NULL,
  `precovenda` DECIMAL(5,2) NOT NULL,
  `tipopagamento` ENUM('D', 'F') NOT NULL,
  `dh` TIMESTAMP NOT NULL,
  `funcionarioId` INT NOT NULL,
  `lojaId` INT NOT NULL,
  `clienteCpf` VARCHAR(14) NULL,
  `produto_id` INT NOT NULL,
  `quantidade` INT NOT NULL,
  PRIMARY KEY (`id`, `funcionarioId`, `lojaId`, `clienteCpf`, `produto_id`),
  INDEX `cpfcliente` (`cpfcliente` ASC),
  INDEX `fk_venda_usuario_idx` (`funcionarioId` ASC),
  INDEX `fk_venda_loja1_idx` (`lojaId` ASC),
  INDEX `fk_venda_cliente1_idx` (`clienteCpf` ASC),
  INDEX `fk_venda_produto1_idx` (`produto_id` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dsoutlet`.`registro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dsoutlet`.`registro` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo` ENUM('E', 'S') NOT NULL,
  `dia` DATE NOT NULL,
  `vendaId` INT NULL,
  `produtoId` INT NULL,
  PRIMARY KEY (`id`, `produtoId`, `vendaId`),
  INDEX `fk_registro_venda1_idx` (`vendaId` ASC),
  INDEX `fk_registro_produto1_idx` (`produtoId` ASC),
  CONSTRAINT `fk_registro_venda1`
    FOREIGN KEY (`vendaId`)
    REFERENCES `dsoutlet`.`venda` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_registro_produto1`
    FOREIGN KEY (`produtoId`)
    REFERENCES `dsoutlet`.`produto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
