
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `estacionamento` DEFAULT CHARACTER SET utf8 ;
USE `estacionamento` ;


CREATE TABLE IF NOT EXISTS `estacionamento`.`tbl_valor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `valo_primeira_hora` DECIMAL(4,2) NOT NULL,
  `valor_demais_horas` DECIMAL(4,2) NOT NULL,
  `data_fim` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `estacionamento`.`tbl_usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(25) NOT NULL,
  `usuario` VARCHAR(25) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `estacionamento`.`tbl_movimentacao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `placa` VARCHAR(7) NOT NULL,
  `modelo` VARCHAR(20) NOT NULL,
  `data_entrada` DATE NOT NULL,
  `data_saida` DATE NOT NULL,
  `tempo` TIME NOT NULL,
  `valor_pago` DECIMAL(4,2) NOT NULL,
  `fk_valor` INT NOT NULL,
  `fk_usuario` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tbl_movimentacao_tbl_valor_idx` (`fk_valor` ASC) VISIBLE,
  INDEX `fk_tbl_movimentacao_tbl_usuario1_idx` (`fk_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_tbl_movimentacao_tbl_valor`
    FOREIGN KEY (`fk_valor`)
    REFERENCES `estacionamento`.`tbl_valor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_movimentacao_tbl_usuario1`
    FOREIGN KEY (`fk_usuario`)
    REFERENCES `estacionamento`.`tbl_usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
