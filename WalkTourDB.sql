CREATE DATABASE WalkTourDB;
USE WalkTourDB;

-- -----------------------------------------------------
-- Table WalkTourDB.`table1`
-- -----------------------------------------------------
CREATE TABLE WalkTourDB.`table1` (
);


-- -----------------------------------------------------
-- Table WalkTourDB.`enderecos`
-- -----------------------------------------------------
CREATE TABLE WalkTourDB.`enderecos` (
  `endereco_id` INT NOT NULL AUTO_INCREMENT,
  `cep` VARCHAR(45) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `estado` VARCHAR(45) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`endereco_id`));


-- -----------------------------------------------------
-- Table WalkTourDB.`eventos`
-- -----------------------------------------------------
CREATE TABLE WalkTourDB.`eventos` (
  `id_evento` INT NOT NULL AUTO_INCREMENT,
  `dia_inicio` DATE NOT NULL,
  `dia_fim` DATE NOT NULL,
  `hora_inicio` TIME NOT NULL,
  `hora_fim` TIME NOT NULL,
  `nome_evento` VARCHAR(45) NOT NULL,
  `preco` FLOAT NOT NULL,
  `endereco_id` INT NOT NULL,
  PRIMARY KEY (`id_evento`, `endereco_id`),
  CONSTRAINT `fk_eventos_enderecos`
    FOREIGN KEY (`endereco_id`)
    REFERENCES WalkTourDB.`enderecos` (`endereco_id`));


-- -----------------------------------------------------
-- Table WalkTourDB.`pontos_tur`
-- -----------------------------------------------------
CREATE TABLE WalkTourDB.`pontos_tur` (
  `ponto_id` INT NOT NULL AUTO_INCREMENT,
  `hora_abre` TIME NOT NULL,
  `hora_fecha` TIME NOT NULL,
  `preco` FLOAT NOT NULL,
  `endereco_id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ponto_id`, `endereco_id`),
  CONSTRAINT `fk_pontos_tur_enderecos1`
    FOREIGN KEY (`endereco_id`)
    REFERENCES WalkTourDB.`enderecos` (`endereco_id`));


-- -----------------------------------------------------
-- Table WalkTourDB.`hospedes`
-- -----------------------------------------------------
CREATE TABLE WalkTourDB.`hospedes` (
  `id_hospede` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `nome_social` VARCHAR(45) NOT NULL,
  `dt_nasc` DATE NOT NULL,
  `cpf` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_hospede`));


-- -----------------------------------------------------
-- Table WalkTourDB.`hospedagens`
-- -----------------------------------------------------
CREATE TABLE WalkTourDB.`hospedagens` (
  `id_hospedagem` INT NOT NULL AUTO_INCREMENT,
  `forma_pag` VARCHAR(45) NOT NULL,
  `data_in` DATE NOT NULL,
  `data_out` DATE NOT NULL,
  `preco` FLOAT NOT NULL,
  PRIMARY KEY (`id_hospedagem`));


-- -----------------------------------------------------
-- Table WalkTourDB.`modelo_quarto`
-- -----------------------------------------------------
CREATE TABLE WalkTourDB.`modelo_quarto` (
  `tipo_id` INT NOT NULL AUTO_INCREMENT,
  `nome_modelo` VARCHAR(45) NOT NULL,
  `qtd_banheiro` INT NOT NULL,
  `qtd_camas` INT NOT NULL,
  `frigobar` TINYINT NOT NULL,
  `servico_quarto` TINYINT NOT NULL,
  PRIMARY KEY (`tipo_id`));


-- -----------------------------------------------------
-- Table WalkTourDB.`quarto`
-- -----------------------------------------------------
CREATE TABLE WalkTourDB.`quarto` (
  `num_quarto` INT NOT NULL AUTO_INCREMENT,
  `hora_limpeza` TIME NOT NULL,
  `servico_quarto` TINYINT NOT NULL,
  `tipo_id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`num_quarto`, `tipo_id`),
  CONSTRAINT `fk_quarto_modelo_quarto1`
    FOREIGN KEY (`tipo_id`)
    REFERENCES WalkTourDB.`modelo_quarto` (`tipo_id`));


-- -----------------------------------------------------
-- Table WalkTourDB.`hoteis`
-- -----------------------------------------------------
CREATE TABLE WalkTourDB.`hoteis` (
  `hotel_id` INT NOT NULL AUTO_INCREMENT,
  `hora_checkin` TIME NOT NULL,
  `hora_checkout` TIME NOT NULL,
  `endereco_id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`hotel_id`, `endereco_id`),
  CONSTRAINT `fk_hoteis_enderecos1`
    FOREIGN KEY (`endereco_id`)
    REFERENCES WalkTourDB.`enderecos` (`endereco_id`));


-- -----------------------------------------------------
-- Table WalkTourDB.`detalhes_hospedagem`
-- -----------------------------------------------------
CREATE TABLE WalkTourDB.`detalhes_hospedagem` (
  `id_detalhe_hospedagem` INT NOT NULL AUTO_INCREMENT,
  `id_hospedagem` INT NOT NULL AUTO_INCREMENT,
  `id_hospede` INT NOT NULL AUTO_INCREMENT,
  `num_quarto` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_detalhe_hospedagem`, `id_hospedagem`, `id_hospede`, `num_quarto`),
  CONSTRAINT `fk_hospedagens_has_hospedes_hospedagens1`
    FOREIGN KEY (`id_hospedagem`)
    REFERENCES WalkTourDB.`hospedagens` (`id_hospedagem`),
  CONSTRAINT `fk_hospedagens_has_hospedes_hospedes1`
    FOREIGN KEY (`id_hospede`)
    REFERENCES WalkTourDB.`hospedes` (`id_hospede`),
  CONSTRAINT `fk_hospedagens_has_hospedes_quarto1`
    FOREIGN KEY (`num_quarto`)
    REFERENCES WalkTourDB.`quarto` (`num_quarto`)
    );