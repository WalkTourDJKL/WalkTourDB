DROP DATABASE IF EXISTS WalkTourDB;
CREATE DATABASE IF NOT EXISTS WalkTourDB;
USE WalkTourDB;
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
  `endereco_id` INT NOT NULL,
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
  `"Sim"o` TINYINT NOT NULL,
  PRIMARY KEY (`tipo_id`));



-- -----------------------------------------------------
-- Table WalkTourDB.`quarto`
-- -----------------------------------------------------
CREATE TABLE WalkTourDB.`quarto` (
  `num_quarto` INT NOT NULL AUTO_INCREMENT,
  `hora_limpeza` TIME NOT NULL,
  `tipo_id` INT NOT NULL ,
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
  `endereco_id` INT NOT NULL,
  PRIMARY KEY (`hotel_id`, `endereco_id`),
  CONSTRAINT `fk_hoteis_enderecos1`
    FOREIGN KEY (`endereco_id`)
    REFERENCES WalkTourDB.`enderecos` (`endereco_id`));



-- -----------------------------------------------------
-- Table WalkTourDB.`detalhes_hospedagem`
-- -----------------------------------------------------
CREATE TABLE WalkTourDB.`detalhes_hospedagem` (
  `id_detalhe_hospedagem` INT NOT NULL ,
  `id_hospedagem` INT NOT NULL ,
  `id_hospede` INT NOT NULL ,
  `num_quarto` INT NOT NULL ,
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

    
    /* Nenhuma chave estrangeira */
	insert into enderecos (cidade, estado, pais, cep) values ('BR', 'GN', 'Brazil', '95335-000');
	insert into enderecos (cidade, estado, pais, cep) values ('BR', 'CD', 'Brazil', '13315-000');
	insert into enderecos (cidade, estado, pais, cep) values ('BR', 'YE', 'Brazil', '09700-000');
	insert into enderecos (cidade, estado, pais, cep) values ('BR', 'PT', 'Brazil', '88800-000');
	insert into enderecos (cidade, estado, pais, cep) values ('BR', 'SE', 'Brazil', '11920-000');
	insert into enderecos (cidade, estado, pais, cep) values ('BR', 'ID', 'Brazil', '17350-000');
	insert into enderecos (cidade, estado, pais, cep) values ('BR', 'TJ', 'Brazil', '48730-000');
	insert into enderecos (cidade, estado, pais, cep) values ('BR', 'PH', 'Brazil', '39510-000');
	insert into enderecos (cidade, estado, pais, cep) values ('BR', 'CN', 'Brazil', '78460-000');
	insert into enderecos (cidade, estado, pais, cep) values ('BR', 'ID', 'Brazil', '68900-000');
	insert into enderecos (cidade, estado, pais, cep) values ('BR', 'SE', 'Brazil', '39100-000');
	insert into enderecos (cidade, estado, pais, cep) values ('BR', 'AM', 'Brazil', '36280-000');
	insert into enderecos (cidade, estado, pais, cep) values ('BR', 'PH', 'Brazil', '13190-000');
	insert into enderecos (cidade, estado, pais, cep) values ('BR', 'CN', 'Brazil', '95650-000');
	insert into enderecos (cidade, estado, pais, cep) values ('BR', 'DK', 'Brazil', '36300-000');
	insert into enderecos (cidade, estado, pais, cep) values ('BR', 'BR', 'Brazil', '58378-000');
	insert into enderecos (cidade, estado, pais, cep) values ('BR', 'GR', 'Brazil', '13690-000');
	insert into enderecos (cidade, estado, pais, cep) values ('BR', 'BR', 'Brazil', '27500-000');
	insert into enderecos (cidade, estado, pais, cep) values ('BR', 'SE', 'Brazil', '68600-000');
	insert into enderecos (cidade, estado, pais, cep) values ('BR', 'HR', 'Brazil', '38200-000');

	/* 1 chave estrangeira */
	insert into eventos (dia_inicio, dia_fim, hora_inicio, hora_fim, nome_evento, preco, endereco_id) values ('2023-9-6', '2023-1-10', '7:28 AM', '4:44 AM', 'Bogan LLC', '$513.52', endereco_id);
	insert into eventos (dia_inicio, dia_fim, hora_inicio, hora_fim, nome_evento, preco, endereco_id) values ('2023-19-9', '1-11-2023', '7:29 AM', '8:37 AM', 'Vandervort, Ward and O''Kon', '$405.95', endereco_id);
	insert into eventos (dia_inicio, dia_fim, hora_inicio, hora_fim, nome_evento, preco, endereco_id) values ('2-21-2023', '5-26-2023', '7:15 AM', '8:03 AM', 'Keeling LLC', '$29.79', endereco_id);
	insert into eventos (dia_inicio, dia_fim, hora_inicio, hora_fim, nome_evento, preco, endereco_id) values ('6-21-2023', '1-27-2023', '7:11 AM', '12:43 AM', 'Dickinson Inc', '$100.95', endereco_id);
	insert into eventos (dia_inicio, dia_fim, hora_inicio, hora_fim, nome_evento, preco, endereco_id) values ('12-29-2022', '12-4-2022', '7:05 AM', '8:25 PM', 'Pfannerstill, Blick and Franecki', '$532.80', endereco_id);
	insert into eventos (dia_inicio, dia_fim, hora_inicio, hora_fim, nome_evento, preco, endereco_id) values ('1-21-2023', '3-29-2023', '7:08 AM', '7:56 AM', 'Schowalter, Mueller and Watsica', '$478.88', endereco_id);
	insert into eventos (dia_inicio, dia_fim, hora_inicio, hora_fim, nome_evento, preco, endereco_id) values ('6-14-2023', '4-30-2023', '7:25 AM', '6:47 PM', 'Friesen and Sons', '$461.64', endereco_id);
	insert into eventos (dia_inicio, dia_fim, hora_inicio, hora_fim, nome_evento, preco, endereco_id) values ('1-15-2023', '11-23-2022', '7:08 AM', '7:51 AM', 'Goldner and Sons', '$398.27', endereco_id);
	insert into eventos (dia_inicio, dia_fim, hora_inicio, hora_fim, nome_evento, preco, endereco_id) values ('3-21-2023', '11-10-2022', '7:11 AM', '5:19 AM', 'Hansen, Hauck and Quitzon', '$105.47', endereco_id);
	insert into eventos (dia_inicio, dia_fim, hora_inicio, hora_fim, nome_evento, preco, endereco_id) values ('4-20-2023', '6-14-2023', '7:17 AM', '8:54 PM', 'Carroll-Thompson', '$549.21', endereco_id);
	insert into eventos (dia_inicio, dia_fim, hora_inicio, hora_fim, nome_evento, preco, endereco_id) values ('10-15-2023', '10-6-2023', '7:20 AM', '2:13 PM', 'Cruickshank, Veum and Howe', '$207.15', endereco_id);
	insert into eventos (dia_inicio, dia_fim, hora_inicio, hora_fim, nome_evento, preco, endereco_id) values ('1-4-2023', '6-8-2023', '7:13 AM', '7:48 PM', 'Bartoletti-Wintheiser', '$148.63', endereco_id);
	insert into eventos (dia_inicio, dia_fim, hora_inicio, hora_fim, nome_evento, preco, endereco_id) values ('7-11-2023', '8-11-2023', '7:21 AM', '8:51 AM', 'Lowe, Christiansen and Ledner', '$363.98', endereco_id);
	insert into eventos (dia_inicio, dia_fim, hora_inicio, hora_fim, nome_evento, preco, endereco_id) values ('2-13-2023', '4-1-2023', '7:16 AM', '1:45 PM', 'Crona Inc', '$262.66', endereco_id);
	insert into eventos (dia_inicio, dia_fim, hora_inicio, hora_fim, nome_evento, preco, endereco_id) values ('10-28-2022', '8-15-2023', '7:02 AM', '11:23 AM', 'Casper Inc', '$297.29', endereco_id);
	insert into eventos (dia_inicio, dia_fim, hora_inicio, hora_fim, nome_evento, preco, endereco_id) values ('9-28-2023', '5-3-2023', '7:22 AM', '4:09 AM', 'Cremin Inc', '$264.03', endereco_id);
	insert into eventos (dia_inicio, dia_fim, hora_inicio, hora_fim, nome_evento, preco, endereco_id) values ('11-20-2022', '12-25-2022', '7:04 AM', '7:15 AM', 'Jast Inc', '$406.40', endereco_id);
	insert into eventos (dia_inicio, dia_fim, hora_inicio, hora_fim, nome_evento, preco, endereco_id) values ('12-11-2022', '2-25-2023', '7:24 AM', '7:39 PM', 'Torphy, Shields and Davis', '$76.38', endereco_id);
	insert into eventos (dia_inicio, dia_fim, hora_inicio, hora_fim, nome_evento, preco, endereco_id) values ('8-6-2023', '7-12-2023', '7:23 AM', '11:20 PM', 'Kunde Inc', '$441.18', endereco_id);
	insert into eventos (dia_inicio, dia_fim, hora_inicio, hora_fim, nome_evento, preco, endereco_id) values ('9-21-2023', '11-16-2022', '7:07 AM', '11:03 PM', 'Hermann-Howell', '$535.89', endereco_id);
    
    /* 1 chave estrangeira */
	insert into pontos_tur (hora_abre, hora_fecha, preco, enderec_id) values ('6:05 AM', '8:49 PM', 'R$113.98', endereco_id);
	insert into pontos_tur (hora_abre, hora_fecha, preco, enderec_id) values ('6:26 AM', '8:11 PM', 'R$37.56', endereco_id);
	insert into pontos_tur (hora_abre, hora_fecha, preco, enderec_id) values ('6:16 AM', '10:52 PM', 'R$56.51', endereco_id);
	insert into pontos_tur (hora_abre, hora_fecha, preco, enderec_id) values ('6:13 AM', '8:29 PM', 'R$66.96', endereco_id);
	insert into pontos_tur (hora_abre, hora_fecha, preco, enderec_id) values ('6:10 AM', '9:39 PM', 'R$73.72', endereco_id);
	insert into pontos_tur (hora_abre, hora_fecha, preco, enderec_id) values ('6:21 AM', '8:17 PM', 'R$83.58', endereco_id);
	insert into pontos_tur (hora_abre, hora_fecha, preco, enderec_id) values ('6:00 AM', '9:25 PM', 'R$76.19', endereco_id);
	insert into pontos_tur (hora_abre, hora_fecha, preco, enderec_id) values ('6:01 AM', '10:44 PM', 'R$73.44', endereco_id);
	insert into pontos_tur (hora_abre, hora_fecha, preco, enderec_id) values ('6:11 AM', '8:07 PM', 'R$93.62', endereco_id);
	insert into pontos_tur (hora_abre, hora_fecha, preco, enderec_id) values ('6:02 AM', '10:12 PM', 'R$38.94', endereco_id);
	insert into pontos_tur (hora_abre, hora_fecha, preco, enderec_id) values ('6:23 AM', '9:18 PM', 'R$119.06', endereco_id);
	insert into pontos_tur (hora_abre, hora_fecha, preco, enderec_id) values ('6:23 AM', '8:13 PM', 'R$76.35', endereco_id);
	insert into pontos_tur (hora_abre, hora_fecha, preco, enderec_id) values ('6:01 AM', '8:38 PM', 'R$118.22', endereco_id);
	insert into pontos_tur (hora_abre, hora_fecha, preco, enderec_id) values ('6:20 AM', '10:38 PM', 'R$80.22', endereco_id);
	insert into pontos_tur (hora_abre, hora_fecha, preco, enderec_id) values ('6:24 AM', '10:48 PM', 'R$87.31', endereco_id);
	insert into pontos_tur (hora_abre, hora_fecha, preco, enderec_id) values ('6:21 AM', '9:33 PM', 'R$75.68', endereco_id);
	insert into pontos_tur (hora_abre, hora_fecha, preco, enderec_id) values ('6:10 AM', '9:24 PM', 'R$81.30', endereco_id);
	insert into pontos_tur (hora_abre, hora_fecha, preco, enderec_id) values ('6:03 AM', '10:01 PM', 'R$69.47', endereco_id);
	insert into pontos_tur (hora_abre, hora_fecha, preco, enderec_id) values ('6:14 AM', '9:09 PM', 'R$81.52', endereco_id);
	insert into pontos_tur (hora_abre, hora_fecha, preco, enderec_id) values ('6:10 AM', '10:41 PM', 'R$87.33', endereco_id);
    
    /* Nenhuma chave estrangeira */
	insert into hospedes (nome, nome_social, dt_nasc, cpf) values ('Gerry', 'Daryl', '16/1/1930', 17672839653);
	insert into hospedes (nome, nome_social, dt_nasc, cpf) values ('Emmalynne', 'Zeke', '15/3/1987', 91920920872);
	insert into hospedes (nome, nome_social, dt_nasc, cpf) values ('Blake', 'Brittani', '13/10/1920', 185497552);
	insert into hospedes (nome, nome_social, dt_nasc, cpf) values ('Kiersten', 'Waldo', '21/12/1974', 13733984851);
	insert into hospedes (nome, nome_social, dt_nasc, cpf) values ('Mattheus', 'Sherlock', '12/9/1989', 69273392867);
	insert into hospedes (nome, nome_social, dt_nasc, cpf) values ('Berta', 'Boigie', '19/2/1954', 73912143461);
	insert into hospedes (nome, nome_social, dt_nasc, cpf) values ('Dory', 'Erin', '12/10/1954', 62843506504);
	insert into hospedes (nome, nome_social, dt_nasc, cpf) values ('Kara', 'Lyman', '26/4/1918', 8098559818);
	insert into hospedes (nome, nome_social, dt_nasc, cpf) values ('Manolo', 'Zelig', '1/10/1929', 42146997535);
	insert into hospedes (nome, nome_social, dt_nasc, cpf) values ('Valene', 'Alessandro', '8/6/1902', 12982996281);
	insert into hospedes (nome, nome_social, dt_nasc, cpf) values ('Way', 'Dana', '25/12/1975', 80554866441);
	insert into hospedes (nome, nome_social, dt_nasc, cpf) values ('Tammy', 'Darryl', '3/10/1927', 64184002232);
	insert into hospedes (nome, nome_social, dt_nasc, cpf) values ('Rainer', 'Howard', '18/5/1929', 39980131978);
	insert into hospedes (nome, nome_social, dt_nasc, cpf) values ('Bastian', 'Gabriella', '4/11/1970', 39034704162);
	insert into hospedes (nome, nome_social, dt_nasc, cpf) values ('Edan', 'Hansiain', '10/5/1972', 70186535840);
	insert into hospedes (nome, nome_social, dt_nasc, cpf) values ('Schuyler', 'Mylo', '18/12/1922', 57953832660);
	insert into hospedes (nome, nome_social, dt_nasc, cpf) values ('Wells', 'Shaina', '10/5/1953', 67462715744);
	insert into hospedes (nome, nome_social, dt_nasc, cpf) values ('Clare', 'Peg', '18/4/1990', 52917878261);
	insert into hospedes (nome, nome_social, dt_nasc, cpf) values ('Eartha', 'Yoshi', '14/4/1901', 8080951120);
	insert into hospedes (nome, nome_social, dt_nasc, cpf) values ('Chlo', 'Desmond', '22/7/1935', 39102928415);
    
    /* Nenhuma chave estrangeira */
	insert into hospedagens (forma_pag, data_in, data_out, preco) values ('dinheiro', '11/11/2088', '1/12/2046', '$464.24');
	insert into hospedagens (forma_pag, data_in, data_out, preco) values ('dinheiro', '10/2/2095', '7/13/1909', '$383.5');
	insert into hospedagens (forma_pag, data_in, data_out, preco) values ('dinheiro', '5/3/1908', '4/17/1927', '$174.28');
	insert into hospedagens (forma_pag, data_in, data_out, preco) values ('cartão(3x)', '2/4/2059', '8/30/1970', '$200.9');
	insert into hospedagens (forma_pag, data_in, data_out, preco) values ('dinheiro', '10/23/2092', '8/14/1925', '$359.4');
	insert into hospedagens (forma_pag, data_in, data_out, preco) values ('dinheiro', '9/28/1926', '7/19/2043', '$482.72');
	insert into hospedagens (forma_pag, data_in, data_out, preco) values ('boleto', '1/16/2016', '2/18/1969', '$478.68');
	insert into hospedagens (forma_pag, data_in, data_out, preco) values ('dinheiro', '5/1/1941', '4/13/1955', '$110.42');
	insert into hospedagens (forma_pag, data_in, data_out, preco) values ('cartão(3x)', '10/6/1937', '4/17/1920', '$238.92');
	insert into hospedagens (forma_pag, data_in, data_out, preco) values ('cartão(3x)', '9/15/2042', '12/20/1966', '$459.63');
	insert into hospedagens (forma_pag, data_in, data_out, preco) values ('pix', '1/16/1961', '4/20/2005', '$258.3');
	insert into hospedagens (forma_pag, data_in, data_out, preco) values ('boleto', '4/29/1931', '1/21/1917', '$445.89');
	insert into hospedagens (forma_pag, data_in, data_out, preco) values ('pix', '12/4/2014', '11/7/1954', '$468.65');
	insert into hospedagens (forma_pag, data_in, data_out, preco) values ('cartão(3x)', '9/8/2091', '9/10/1951', '$143.17');
	insert into hospedagens (forma_pag, data_in, data_out, preco) values ('cartão(3x)', '2/14/1984', '1/24/1988', '$381.82');
	insert into hospedagens (forma_pag, data_in, data_out, preco) values ('dinheiro', '7/17/1988', '7/7/2070', '$327.34');
	insert into hospedagens (forma_pag, data_in, data_out, preco) values ('pix', '6/20/2062', '10/27/1995', '$259.66');
	insert into hospedagens (forma_pag, data_in, data_out, preco) values ('boleto', '10/18/2053', '10/18/2021', '$170.21');
	insert into hospedagens (forma_pag, data_in, data_out, preco) values ('dinheiro', '11/22/2055', '12/27/1946', '$418.83');
	insert into hospedagens (forma_pag, data_in, data_out, preco) values ('pix', '7/20/2000', '6/9/2080', '$509.54');
    
    /* Organizar o resto da tabela */
	insert into modelo_quarto (nome_modelo, qtd_banheiro, qtd_camas, frigobar, servico_quarto) values (nome_modelo, 2, 2, "Sim", "Não");
	insert into modelo_quarto (nome_modelo, qtd_banheiro, qtd_camas, frigobar, servico_quarto) values (nome_modelo, 2, 2, "Não", "Sim");
	insert into modelo_quarto (nome_modelo, qtd_banheiro, qtd_camas, frigobar, servico_quarto) values (nome_modelo, 1, 3, "Sim", "Sim");
	insert into modelo_quarto (nome_modelo, qtd_banheiro, qtd_camas, frigobar, servico_quarto) values (nome_modelo, 3, 2, "Sim", "Não");
	insert into modelo_quarto (nome_modelo, qtd_banheiro, qtd_camas, frigobar, servico_quarto) values (nome_modelo, 2, 1, "Não", "Sim");
	insert into modelo_quarto (nome_modelo, qtd_banheiro, qtd_camas, frigobar, servico_quarto) values (nome_modelo, 2, 2, "Sim", "Sim");
	insert into modelo_quarto (nome_modelo, qtd_banheiro, qtd_camas, frigobar, servico_quarto) values (nome_modelo, 3, 1, "Sim", "Sim");
	insert into modelo_quarto (nome_modelo, qtd_banheiro, qtd_camas, frigobar, servico_quarto) values (nome_modelo, 1, 2, "Sim", "Não");
	insert into modelo_quarto (nome_modelo, qtd_banheiro, qtd_camas, frigobar, servico_quarto) values (nome_modelo, 2, 2, "Não", "Sim");
	insert into modelo_quarto (nome_modelo, qtd_banheiro, qtd_camas, frigobar, servico_quarto) values (nome_modelo, 2, 3, "Sim", "Sim");
	insert into modelo_quarto (nome_modelo, qtd_banheiro, qtd_camas, frigobar, servico_quarto) values (nome_modelo, 1, 3, "Não", "Não");
	insert into modelo_quarto (nome_modelo, qtd_banheiro, qtd_camas, frigobar, servico_quarto) values (nome_modelo, 2, 3, "Sim", "Não");
	insert into modelo_quarto (nome_modelo, qtd_banheiro, qtd_camas, frigobar, servico_quarto) values (nome_modelo, 3, 2, "Sim", "Sim");
	insert into modelo_quarto (nome_modelo, qtd_banheiro, qtd_camas, frigobar, servico_quarto) values (nome_modelo, 2, 2, "Sim", "Sim");
	insert into modelo_quarto (nome_modelo, qtd_banheiro, qtd_camas, frigobar, servico_quarto) values (nome_modelo, 2, 1, "Sim", "Sim");
	insert into modelo_quarto (nome_modelo, qtd_banheiro, qtd_camas, frigobar, servico_quarto) values (nome_modelo, 3, 2, "Sim", "Não");
	insert into modelo_quarto (nome_modelo, qtd_banheiro, qtd_camas, frigobar, servico_quarto) values (nome_modelo, 3, 2, "Sim", "Sim");
	insert into modelo_quarto (nome_modelo, qtd_banheiro, qtd_camas, frigobar, servico_quarto) values (nome_modelo, 1, 3, "Não", "Sim");
	insert into modelo_quarto (nome_modelo, qtd_banheiro, qtd_camas, frigobar, servico_quarto) values (nome_modelo, 3, 3, "Sim", "Não");
	insert into modelo_quarto (nome_modelo, qtd_banheiro, qtd_camas, frigobar, servico_quarto) values (nome_modelo, 1, 3, "Não", "Sim");
    
    /* 1 chave estrangeira */
	insert into quarto (hora_limpeza, tipo_id) values ('10:48 AM', tipo_id);
	insert into quarto (hora_limpeza, tipo_id) values ('5:58 PM', tipo_id);
	insert into quarto (hora_limpeza, tipo_id) values ('9:46 AM', tipo_id);
	insert into quarto (hora_limpeza, tipo_id) values ('2:23 PM', tipo_id);
	insert into quarto (hora_limpeza, tipo_id) values ('10:39 AM', tipo_id);
	insert into quarto (hora_limpeza, tipo_id) values ('5:35 AM', tipo_id);
	insert into quarto (hora_limpeza, tipo_id) values ('6:15 PM', tipo_id);
	insert into quarto (hora_limpeza, tipo_id) values ('10:02 AM', tipo_id);
	insert into quarto (hora_limpeza, tipo_id) values ('4:03 AM', tipo_id);
	insert into quarto (hora_limpeza, tipo_id) values ('4:11 AM', tipo_id);
	insert into quarto (hora_limpeza, tipo_id) values ('3:20 AM', tipo_id);
	insert into quarto (hora_limpeza, tipo_id) values ('10:21 AM', tipo_id);
	insert into quarto (hora_limpeza, tipo_id) values ('10:19 AM', tipo_id);
	insert into quarto (hora_limpeza, tipo_id) values ('2:45 PM', tipo_id);
	insert into quarto (hora_limpeza, tipo_id) values ('3:41 PM', tipo_id);
	insert into quarto (hora_limpeza, tipo_id) values ('3:08 PM', tipo_id);
	insert into quarto (hora_limpeza, tipo_id) values ('9:01 AM', tipo_id);
	insert into quarto (hora_limpeza, tipo_id) values ('8:27 AM', tipo_id);
	insert into quarto (hora_limpeza, tipo_id) values ('6:50 AM', tipo_id);
	insert into quarto (hora_limpeza, tipo_id) values ('3:13 AM', tipo_id);
    
    /* 1 chave estrangeira */
	insert into hoteis (hora_checkin, hora_checkout, endereco_id) values (1, '2:57 AM', '7:58 PM', endereco_id);
	insert into hoteis (hora_checkin, hora_checkout, endereco_id) values (2, '3:03 AM', '12:37 AM', endereco_id);
	insert into hoteis (hora_checkin, hora_checkout, endereco_id) values (3, '5:33 PM', '4:31 AM', endereco_id);
	insert into hoteis (hora_checkin, hora_checkout, endereco_id) values (4, '6:04 AM', '5:13 PM', endereco_id);
	insert into hoteis (hora_checkin, hora_checkout, endereco_id) values (5, '12:43 AM', '1:45 PM', endereco_id);
	insert into hoteis (hora_checkin, hora_checkout, endereco_id) values (6, '9:41 AM', '3:57 PM', endereco_id);
	insert into hoteis (hora_checkin, hora_checkout, endereco_id) values (7, '7:32 AM', '9:03 PM', endereco_id);
	insert into hoteis (hora_checkin, hora_checkout, endereco_id) values (8, '4:11 PM', '4:13 AM', endereco_id);
	insert into hoteis (hora_checkin, hora_checkout, endereco_id) values (9, '7:45 PM', '10:27 AM', endereco_id);
	insert into hoteis (hora_checkin, hora_checkout, endereco_id) values (10, '6:52 PM', '11:51 PM', endereco_id);
	insert into hoteis (hora_checkin, hora_checkout, endereco_id) values (11, '10:05 PM', '12:04 PM', endereco_id);
	insert into hoteis (hora_checkin, hora_checkout, endereco_id) values (12, '11:40 AM', '9:06 AM', endereco_id);
	insert into hoteis (hora_checkin, hora_checkout, endereco_id) values (13, '6:40 AM', '5:27 AM', endereco_id);
	insert into hoteis (hora_checkin, hora_checkout, endereco_id) values (14, '3:23 AM', '5:16 PM', endereco_id);
	insert into hoteis (hora_checkin, hora_checkout, endereco_id) values (15, '9:08 AM', '6:30 AM', endereco_id);
	insert into hoteis (hora_checkin, hora_checkout, endereco_id) values (16, '11:18 AM', '12:19 AM', endereco_id);
	insert into hoteis (hora_checkin, hora_checkout, endereco_id) values (17, '9:39 AM', '11:57 AM', endereco_id);
	insert into hoteis (hora_checkin, hora_checkout, endereco_id) values (18, '2:14 AM', '2:31 AM', endereco_id);
	insert into hoteis (hora_checkin, hora_checkout, endereco_id) values (19, '5:00 AM', '4:14 PM', endereco_id);
	insert into hoteis (hora_checkin, hora_checkout, endereco_id) values (20, '7:03 PM', '11:04 PM', endereco_id);
    
    /* Tabela formada por chaves estrangeiras */
	insert into detalhe_hospedagem (id_hospedagem, id_hospede, num_quarto) values (1, 1, 4);
	insert into detalhe_hospedagem (id_hospedagem, id_hospede, num_quarto) values (2, 2, 12);
	insert into detalhe_hospedagem (id_hospedagem, id_hospede, num_quarto) values (3, 3, 23);
	insert into detalhe_hospedagem (id_hospedagem, id_hospede, num_quarto) values (4, 4, 20);
	insert into detalhe_hospedagem (id_hospedagem, id_hospede, num_quarto) values (5, 5, 9);
	insert into detalhe_hospedagem (id_hospedagem, id_hospede, num_quarto) values (6, 6, 27);
	insert into detalhe_hospedagem (id_hospedagem, id_hospede, num_quarto) values (7, 7, 1);
	insert into detalhe_hospedagem (id_hospedagem, id_hospede, num_quarto) values (8, 8, 9);
	insert into detalhe_hospedagem (id_hospedagem, id_hospede, num_quarto) values (9, 9, 15);
	insert into detalhe_hospedagem (id_hospedagem, id_hospede, num_quarto) values (10, 10, 4);
	insert into detalhe_hospedagem (id_hospedagem, id_hospede, num_quarto) values (11, 11, 26);
	insert into detalhe_hospedagem (id_hospedagem, id_hospede, num_quarto) values (12, 12, 21);
	insert into detalhe_hospedagem (id_hospedagem, id_hospede, num_quarto) values (13, 13, 7);
	insert into detalhe_hospedagem (id_hospedagem, id_hospede, num_quarto) values (14, 14, 38);
	insert into detalhe_hospedagem (id_hospedagem, id_hospede, num_quarto) values (15, 15, 6);
	insert into detalhe_hospedagem (id_hospedagem, id_hospede, num_quarto) values (16, 16, 37);
	insert into detalhe_hospedagem (id_hospedagem, id_hospede, num_quarto) values (17, 17, 37);
	insert into detalhe_hospedagem (id_hospedagem, id_hospede, num_quarto) values (18, 18, 40);
	insert into detalhe_hospedagem (id_hospedagem, id_hospede, num_quarto) values (19, 19, 38);
	insert into detalhe_hospedagem (id_hospedagem, id_hospede, num_quarto) values (20, 20, 5);
    
    
	UPDATE hoteis
	set hora_checkin = "11:50 AM", hora_checkout = "17:30 PM"
	WHERE hotel_id = 1;

	UPDATE hoteis 
	set hora_checkin = "08:00 PM", hora_checkout = "10:00 AM"
	WHERE hotel_id = 2;
	
	UPDATE hoteis 
	set hora_checkin = "11:50 PM", hora_checkout = "07:10 AM"
	WHERE hotel_id = 3;
	
	UPDATE hoteis 
	set hora_checkin = "07:00 PM", hora_checkout = "09:25 AM"
	WHERE hotel_id = 4;
	
	UPDATE hoteis 
	set hora_checkin = "09:06 PM", hora_checkout = "04:00 AM"
	WHERE hotel_id = 5;
	
	UPDATE hoteis 
	set hora_checkin = "10:30 PM", hora_checkout = "05:20 PM"
	WHERE hotel_id = 6;
	
	UPDATE hoteis 
	set hora_checkin = "03:30 PM", hora_checkout = "03:45 AM"
	WHERE hotel_id = 7;
	
	UPDATE hoteis 
	set hora_checkin = "08:08 AM", hora_checkout = "07:56 AM"
	WHERE hotel_id = 8;
	
	UPDATE hoteis 
	set hora_checkin = "08:00 AM", hora_checkout = "10:00 PM"
	WHERE hotel_id = 9;
	
	UPDATE hoteis 
	set hora_checkin = "10:40 AM", hora_checkout = "06:00 PM"
	WHERE hotel_id = 10;



	UPDATE hospedes
	set nome ="Valesca da Silva", nome_social = "Valesca Popozuda", dt_nasc = "2000-02-02", cpf = "11111111111"
	WHERE id_hospede = 1;

	UPDATE hospedes 
	set nome ="Kemily Cristina Schmidt de Oliveira", nome_social = NULL, dt_nasc = "2005-01-17", cpf = "11111151111"
	WHERE id_hospede = 2;
	
	UPDATE hospedes 
	set nome ="Marco Telles", nome_social = NULL, dt_nasc = "1998-10-27", cpf = "11113411111"
	WHERE id_hospede = 3;
	
	UPDATE hospedes 
	set nome = "Douglas Eduardo Fernandes", nome_social = NULL, dt_nasc = "2005-05-25", cpf = "12842822988"
	WHERE id_hospede = 4;
	
	UPDATE hospedes 
	set nome ="Jose Paulo Baptista", nome_social = NULL, dt_nasc = "2005-05-09", cpf = "11111111117"
	WHERE id_hospede = 5;
	
	UPDATE hospedes 
	set nome ="Lucas Guerega", nome_social = NULL, dt_nasc = "2006-11-13", cpf = "18111111111"
	WHERE id_hospede = 6;
	
	UPDATE hospedes 
	set nome ="Leticia Elizama", nome_social = "Valesca Popozuda", dt_nasc = "2008-04-01", cpf = "11119111111"
	WHERE id_hospede = 7;
	
	UPDATE hospedes 
	set nome ="Eliza de Venezza Mantins", nome_social = "Sammy", dt_nasc = "1978-12-19", cpf = "11111111167"
	WHERE id_hospede = 8;
	
	UPDATE hospedes 
	set nome ="Jenifer Cardoso", nome_social = FULL, dt_nasc = "2006-02-23", cpf = "11111114111"
	WHERE id_hospede = 9;
	
	UPDATE hospedes 
	set nome ="Cleber Viliano de Oliveira", nome_social = NULL, dt_nasc = "2000-02-03", cpf = "34111111111"
	WHERE id_hospede = 10;
    /*
    UPDATE enderecos
	SET cidade = 'Campo Grande', estado = 'MS', pais = 'Brasil', cep = 95435-000
	WHERE endereco_id = 1;

	UPDATE enderecos
	SET cidade = 'Garuva', estado = 'SC', pais = 'Brasil', cep = 95225-000
	WHERE endereco_id = 2;   */

-- -----------------------------------------------------
-- Deletes em cada tabela da WalkTourDB
-- -----------------------------------------------------

    DELETE * FROM enderecos WHERE endereco_id = 1;
    DELETE * FROM enderecos WHERE endereco_id = 2;
    DELETE * FROM enderecos WHERE endereco_id = 3;
    DELETE * FROM enderecos WHERE endereco_id = 4;
    DELETE * FROM enderecos WHERE endereco_id = 5;


    DELETE * FROM eventos WHERE id_evento = 16;
    DELETE * FROM eventos WHERE id_evento = 17;
    DELETE * FROM eventos WHERE id_evento = 19;
    DELETE * FROM eventos WHERE id_evento = 18;
    DELETE * FROM eventos WHERE id_evento = 20;


    DELETE * FROM pontos_tur WHERE ponto_id = 1;
    DELETE * FROM pontos_tur WHERE ponto_id = 2;
    DELETE * FROM pontos_tur WHERE ponto_id = 16;
    DELETE * FROM pontos_tur WHERE ponto_id = 17;
    DELETE * FROM pontos_tur WHERE ponto_id = 3;


    DELETE * FROM hospedes WHERE id_hospede = 20;
    DELETE * FROM hospedes WHERE id_hospede = 19;
    DELETE * FROM hospedes WHERE id_hospede = 16;
    DELETE * FROM hospedes WHERE id_hospede = 17;
    DELETE * FROM hospedes WHERE id_hospede = 18;


    DELETE * FROM hospedagens WHERE id_hospedagem = 1;
    DELETE * FROM hospedagens WHERE id_hospedagem = 2;
    DELETE * FROM hospedagens WHERE id_hospedagem = 3;
    DELETE * FROM hospedagens WHERE id_hospedagem = 4;
    DELETE * FROM hospedagens WHERE id_hospedagem = 20;


    DELETE * FROM modelo_quarto WHERE tipo_id = 1;
    DELETE * FROM modelo_quarto WHERE tipo_id = 17;
    DELETE * FROM modelo_quarto WHERE tipo_id = 18;
    DELETE * FROM modelo_quarto WHERE tipo_id = 19;
    DELETE * FROM modelo_quarto WHERE tipo_id = 20;


    DELETE * FROM quarto WHERE num_quarto = 1;
    DELETE * FROM quarto WHERE num_quarto = 2;
    DELETE * FROM quarto WHERE num_quarto = 16;
    DELETE * FROM quarto WHERE num_quarto = 17;
    DELETE * FROM quarto WHERE num_quarto = 5;


    DELETE * FROM hoteis WHERE hotel_id = 1;
    DELETE * FROM hoteis WHERE hotel_id = 2;
    DELETE * FROM hoteis WHERE hotel_id = 3;
    DELETE * FROM hoteis WHERE hotel_id = 4;
    DELETE * FROM hoteis WHERE hotel_id = 5;


    DELETE * FROM detalhes_hospedagem WHERE id_detalhe_hospedagem = 16;
    DELETE * FROM detalhes_hospedagem WHERE id_detalhe_hospedagem = 17;
    DELETE * FROM detalhes_hospedagem WHERE id_detalhe_hospedagem = 18;
    DELETE * FROM detalhes_hospedagem WHERE id_detalhe_hospedagem = 19;
    DELETE * FROM detalhes_hospedagem WHERE id_detalhe_hospedagem = 20;
