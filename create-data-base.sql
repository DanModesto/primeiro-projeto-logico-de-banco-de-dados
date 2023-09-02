-- Crie o banco de dados e o selecione para uso
CREATE DATABASE ecommerce;

-- Use o banco de dados recém-criado
USE ecommerce;

-- Crie a tabela "Clientes"
CREATE TABLE Clientes (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    email VARCHAR(45) UNIQUE NOT NULL,
    telefone VARCHAR(45),
    endereco VARCHAR(45)
);

-- Crie a tabela "Produtos"
CREATE TABLE Produtos (
    produto_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT NOT NULL
);

-- Crie a tabela "Categorias"
CREATE TABLE Categorias (
    categoria_id INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(45) NOT NULL
);

-- Crie a tabela "Pedidos"
CREATE TABLE Pedidos (
    pedido_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    data_pedido DATETIME,
    status VARCHAR(45),
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id)
);

-- Crie a tabela "Itens do Pedido"
CREATE TABLE Itens_do_Pedido (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT NOT NULL,
    produto_id INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES Pedidos(pedido_id),
    FOREIGN KEY (produto_id) REFERENCES Produtos(produto_id)
);

-- Crie a tabela "Avaliações de Produtos"
CREATE TABLE Avaliacoes_de_Produtos (
    avaliacao_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    produto_id INT NOT NULL,
    classificacao INT NOT NULL,
    comentario TEXT,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id),
    FOREIGN KEY (produto_id) REFERENCES Produtos(produto_id)
);
