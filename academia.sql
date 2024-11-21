CREATE DATABASE IF NOT EXISTS academia;

USE academia;

-- -----------------------------------------------------
-- Table `mydb`.`tipos_planos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS tipos_planos(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  tipos_planos VARCHAR(45) NOT NULL,
  data_criacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);


-- -----------------------------------------------------
-- Table `mydb`.`planos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS planos(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  descricao VARCHAR(80) NOT NULL,
  data_criacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  tipos_planos_id INT NOT NULL,
    FOREIGN KEY (tipos_planos_id) REFERENCES tipos_planos(id)
    ON DELETE NO ACTION
    ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table `mydb`.`tipos_servicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS tipos_servicos(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  servicos VARCHAR(45) NOT NULL,
  data_criacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);


-- -----------------------------------------------------
-- Table `mydb`.`servicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS servicos(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  data_criacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  descricao VARCHAR(45) NOT NULL,
  tipos_servicos_id INT NOT NULL,
    FOREIGN KEY (tipos_servicos_id) REFERENCES tipos_servicos(id)
    ON DELETE NO ACTION
    ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table `mydb`.`enderecos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS enderecos(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  cep VARCHAR(10) NOT NULL,
  endereco VARCHAR(45) NOT NULL,
  num VARCHAR(10) NOT NULL,
  complemento VARCHAR(45) NULL,
  bairro VARCHAR(45) NOT NULL,
  cidade VARCHAR(45) NOT NULL,
  estado VARCHAR(5) NOT NULL,
  data_criacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);


-- -----------------------------------------------------
-- Table `mydb`.`login`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS login(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  login VARCHAR(45) NOT NULL,
  senha VARCHAR(255) NOT NULL,
  data_criacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);


-- -----------------------------------------------------
-- Table `mydb`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS cliente(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(45) NOT NULL,
  tel VARCHAR(20) NOT NULL,
  cpf VARCHAR(14) NOT NULL,
  data_nasc DATE NOT NULL,
  email VARCHAR(45) NOT NULL,
  genero ENUM('masculino', 'feminino', 'outros') NOT NULL,
  data_criacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  planos_id INT NOT NULL,
  servicos_id INT NOT NULL,
  enderecos_id INT NOT NULL,
  login_id INT NOT NULL,
    FOREIGN KEY (planos_id) REFERENCES planos(id)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
    FOREIGN KEY (servicos_id) REFERENCES servicos(id)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
    FOREIGN KEY (enderecos_id) REFERENCES enderecos(id)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
    FOREIGN KEY (login_id) REFERENCES login(id)
    ON DELETE NO ACTION
    ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table `mydb`.`agenda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS agenda(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  agenda_do_dia VARCHAR(100) NOT NULL,
  data_criacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);


-- -----------------------------------------------------
-- Table `mydb`.`docs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS docs(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  termo LONGTEXT NOT NULL,
  data_criacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  cliente_id INT NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES cliente(id)
    ON DELETE NO ACTION
    ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table `mydb`.`treino_do_dia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS treino_do_dia(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  descricao VARCHAR(150) NOT NULL,
  data_criacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  cliente_id INT NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES cliente(id)
    ON DELETE NO ACTION
    ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table `mydb`.`timeline`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS timeline(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  media_url VARCHAR(500) NULL,
  data_criacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  cliente_id INT NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES cliente(id)
    ON DELETE NO ACTION
    ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table `mydb`.`notificacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS notificacao(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  push VARCHAR(45) NOT NULL,
  data_criacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  cliente_id INT NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES cliente(id)
    ON DELETE NO ACTION
    ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table `mydb`.`pendencias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS pendencias(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  descricao VARCHAR(45) NOT NULL,
  data_criacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  cliente_id INT NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES cliente (id)
    ON DELETE NO ACTION
    ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table `mydb`.`historico_pagamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS historico_pagamentos(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  extrato VARCHAR(45) NOT NULL,
  data_criacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  cliente_id INT NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES cliente(id)
    ON DELETE NO ACTION
    ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table `mydb`.`carteira`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS carteira(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  cartao INT NOT NULL,
  data_criacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  cliente_id INT NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES cliente(id)
    ON DELETE NO ACTION
    ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table `mydb`.`biblioteca_exercicios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS biblioteca_exercicios(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  descricao VARCHAR(45) NOT NULL,
  url_media VARCHAR(500) NOT NULL,
  data_criacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);