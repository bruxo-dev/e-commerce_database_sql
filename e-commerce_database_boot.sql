DROP DATABASE IF EXISTS e_commerce; --Tests if the database exists and drop it to prevent errors
CREATE DATABASE e_commerce; --Create the database before creating the tables

CREATE TABLE Fornecedor (
  ID_fornecedor INT PRIMARY KEY,  -- Removed double quotes around table and column names
  razao_social VARCHAR(255),      -- Added length for VARCHAR type
  CNPJ VARCHAR(255) UNIQUE        -- Added length for VARCHAR type
);

CREATE TABLE Produto (
  ID_produto INT PRIMARY KEY,     -- Removed double quotes around table and column names
  categoria VARCHAR(255),         -- Added length for VARCHAR type
  descricao VARCHAR(255),         -- Added length for VARCHAR type
  valor DECIMAL(10, 2)            -- Added length and precision for DECIMAL type
);

CREATE TABLE Estoque (
  ID_estoque INT PRIMARY KEY,     -- Removed double quotes around table and column names
  local VARCHAR(255)              -- Added length for VARCHAR type
);


CREATE TABLE Vendedor_terceiro (
  ID_terceiro INT PRIMARY KEY,    -- Removed double quotes around table and column names
  razao_social VARCHAR(255),      -- Added length for VARCHAR type
  local VARCHAR(255)              -- Added length for VARCHAR type
);

CREATE TABLE Cliente (
  ID_cliente INT PRIMARY KEY,     -- Removed double quotes around table and column names
  nome VARCHAR(255),              -- Added length for VARCHAR type
  identificacao VARCHAR(255) UNIQUE, -- Added length for VARCHAR type
  endereco VARCHAR(255),          -- Added length for VARCHAR type
  tipo VARCHAR(255)               -- Added length for VARCHAR type
);

CREATE TABLE Pedido (
  ID_pedido INT PRIMARY KEY,      -- Removed double quotes around table and column names
  status VARCHAR(255),            -- Added length for VARCHAR type
  descricao VARCHAR(255),         -- Added length for VARCHAR type
  cliente_ID_cliente INT,         -- Removed double quotes around table and column names
  frete DECIMAL(10, 2),           -- Added length and precision for DECIMAL type
  FOREIGN KEY (cliente_ID_cliente) REFERENCES Cliente(ID_cliente)  -- Incorporated FOREIGN KEY constraint directly within the CREATE TABLE statement
);

CREATE TABLE Pagamento (
  ID_pagamento INT PRIMARY KEY,   -- Removed double quotes around table and column names
  tipo VARCHAR(255),              -- Added length for VARCHAR type
  pedido_ID_pedido INT,           -- Removed double quotes around table and column names
  FOREIGN KEY (pedido_ID_pedido) REFERENCES Pedido(ID_pedido)  -- Incorporated FOREIGN KEY constraint directly within the CREATE TABLE statement
);

CREATE TABLE Entrega (
  ID_entrega INT PRIMARY KEY,     -- Removed double quotes around table and column names
  status VARCHAR(255),            -- Added length for VARCHAR type
  codigo_rastreio VARCHAR(255),   -- Added length for VARCHAR type
  pedido_ID_pedido INT,           -- Removed double quotes around table and column names
  FOREIGN KEY (pedido_ID_pedido) REFERENCES Pedido(ID_pedido)  -- Incorporated FOREIGN KEY constraint directly within the CREATE TABLE statement
);

CREATE TABLE Fornecedor_tem_produto (
  fornecedor_ID_fornecedor INT,   -- Removed double quotes around table and column names
  produto_ID_produto INT,         -- Removed double quotes around table and column names
  PRIMARY KEY (fornecedor_ID_fornecedor, produto_ID_produto),  -- Removed double quotes around table and column names
  FOREIGN KEY (fornecedor_ID_fornecedor) REFERENCES Fornecedor(ID_fornecedor), -- Incorporated FOREIGN KEY constraint directly within the CREATE TABLE statement
  FOREIGN KEY (produto_ID_produto) REFERENCES Produto(ID_produto) -- Incorporated FOREIGN KEY constraint directly within the CREATE TABLE statement
);

CREATE TABLE Estoque_tem_produto (
  produto_ID_produto INT,         -- Removed double quotes around table and column names
  estoque_ID_estoque INT,         -- Removed double quotes around table and column names
  quantidade INT,                 -- Removed double quotes around table and column names
  PRIMARY KEY (produto_ID_produto, estoque_ID_estoque),  -- Removed double quotes around table and column names
  FOREIGN KEY (produto_ID_produto) REFERENCES Produto(ID_produto),  -- Incorporated FOREIGN KEY constraint directly within the CREATE TABLE statement
  FOREIGN KEY (estoque_ID_estoque) REFERENCES Estoque(ID_estoque)  -- Incorporated FOREIGN KEY constraint directly within the CREATE TABLE statement
);

CREATE TABLE Terceiro_tem_produto (
  terceiro_ID_terceiro INT,       -- Removed double quotes around table and column names
  produto_ID_produto INT,         -- Removed double quotes around table and column names
  quantidade INT,                 -- Removed double quotes around table and column names
  PRIMARY KEY (terceiro_ID_terceiro, produto_ID_produto),  -- Removed double quotes around table and column names
  FOREIGN KEY (terceiro_ID_terceiro) REFERENCES Vendedor_terceiro(ID_terceiro), -- Incorporated FOREIGN KEY constraint directly within the CREATE TABLE statement
  FOREIGN KEY (produto_ID_produto) REFERENCES Produto(ID_produto) -- Incorporated FOREIGN KEY constraint directly within the CREATE TABLE statement
);

CREATE TABLE Relacao_produto_pedido (
  produto_ID_produto INT,         -- Removed double quotes around table and column names
  pedido_ID_pedido INT,           -- Removed double quotes around table and column names
  quantidade INT,                 -- Removed double quotes around table and column names
  PRIMARY KEY (produto_ID_produto, pedido_ID_pedido),  -- Removed double quotes around table and column names
  FOREIGN KEY (produto_ID_produto) REFERENCES Produto(ID_produto),  -- Incorporated FOREIGN KEY constraint directly within the CREATE TABLE statement
  FOREIGN KEY (pedido_ID_pedido) REFERENCES Pedido(ID_pedido)  -- Incorporated FOREIGN KEY constraint directly within the CREATE TABLE statement
);
