-- Criação do banco de dados (opcional, dependendo do SGBD)
CREATE DATABASE ecommerce;
USE ecommerce;

-- 1. Tabela Cliente
CREATE TABLE Cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    celular VARCHAR(15) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE
);

-- 2. Tabela Endereco
CREATE TABLE Endereco (
    id INT AUTO_INCREMENT PRIMARY KEY,
    rua VARCHAR(150) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    estado VARCHAR(2) NOT NULL
);

-- 3. Tabela Produto
CREATE TABLE Produto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    categoria VARCHAR(50) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    quantidade INT NOT NULL
);

-- 4. Tabela Compra
CREATE TABLE Compra (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data DATE NOT NULL,
    forma_pagamento VARCHAR(50) NOT NULL,
    valor_total DECIMAL(10, 2) NOT NULL,
    Cliente_id INT NOT NULL,
    FOREIGN KEY (Cliente_id) REFERENCES Cliente(id)
);

-- 5. Tabela Possui_Endereco (Relacionamento Cliente-Endereco 1:N)
CREATE TABLE Cliente_Endereco (
    Cliente_id INT NOT NULL,
    Endereco_id INT NOT NULL,
    PRIMARY KEY (Cliente_id, Endereco_id),
    FOREIGN KEY (Cliente_id) REFERENCES Cliente(id),
    FOREIGN KEY (Endereco_id) REFERENCES Endereco(id)
);

-- 6. Tabela Entrega (Relacionamento Compra-Endereco N:N)
CREATE TABLE Entrega (
    Compra_id INT NOT NULL,
    Endereco_id INT NOT NULL,
    PRIMARY KEY (Compra_id, Endereco_id),
    FOREIGN KEY (Compra_id) REFERENCES Compra(id),
    FOREIGN KEY (Endereco_id) REFERENCES Endereco(id)
);

-- 7. Tabela Compra_Produto (Relacionamento Compra-Produto N:N)
CREATE TABLE Compra_Produto (
    Compra_id INT NOT NULL,
    Produto_id INT NOT NULL,
    quantidade INT NOT NULL,
    valor_unitario DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (Compra_id, Produto_id),
    FOREIGN KEY (Compra_id) REFERENCES Compra(id),
    FOREIGN KEY (Produto_id) REFERENCES Produto(id)
);