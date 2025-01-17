DROP DATABASE IF EXISTS e_commerce; -- Tests if the database exists and drops it to prevent errors
CREATE DATABASE e_commerce; -- Create the database before creating the tables

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
  tipo VARCHAR(255) CHECK (tipo IN ('PJ', 'PF')) -- Added length for VARCHAR type and single type restriction
);

CREATE TABLE Pedido (
  ID_pedido INT PRIMARY KEY,      -- Removed double quotes around table and column names
  status VARCHAR(255),            -- Added length for VARCHAR type
  descricao VARCHAR(255),         -- Added length for VARCHAR type
  cliente_ID_cliente INT,         -- Removed double quotes around table and column names
  frete DECIMAL(10, 2),           -- Added length and precision for DECIMAL type
  FOREIGN KEY (cliente_ID_cliente) REFERENCES Cliente(ID_cliente) -- Incorporated FOREIGN KEY constraint directly within the CREATE TABLE statement
);

CREATE TABLE Forma_Pagamento (
  ID_forma_pagamento INT PRIMARY KEY, -- New table to store available payment types
  descricao VARCHAR(255) UNIQUE -- Example: 'Credit Card', 'Pix', 'Boleto'
);

CREATE TABLE Pagamento (
  ID_pagamento INT PRIMARY KEY,       -- Removed double quotes around table and column names
  pedido_ID_pedido INT,               -- Allows associating a payment with an order
  forma_pagamento_ID INT,             -- Links the payment with a payment type
  valor DECIMAL(10, 2),               -- Stores the value of the specific payment
  FOREIGN KEY (pedido_ID_pedido) REFERENCES Pedido(ID_pedido), -- Links payment to the order
  FOREIGN KEY (forma_pagamento_ID) REFERENCES Forma_Pagamento(ID_forma_pagamento) -- Links payment to the payment type
);

CREATE TABLE Entrega (
  ID_entrega INT PRIMARY KEY,         -- Removed double quotes around table and column names
  status VARCHAR(255),                -- Added length for VARCHAR type
  codigo_rastreio VARCHAR(255),       -- Added length for VARCHAR type
  pedido_ID_pedido INT,               -- Removed double quotes around table and column names
  FOREIGN KEY (pedido_ID_pedido) REFERENCES Pedido(ID_pedido) -- Incorporated FOREIGN KEY constraint directly within the CREATE TABLE statement
);

CREATE TABLE Fornecedor_tem_produto (
  fornecedor_ID_fornecedor INT,       -- Removed double quotes around table and column names
  produto_ID_produto INT,             -- Removed double quotes around table and column names
  PRIMARY KEY (fornecedor_ID_fornecedor, produto_ID_produto), -- Composite primary key
  FOREIGN KEY (fornecedor_ID_fornecedor) REFERENCES Fornecedor(ID_fornecedor), -- Foreign key to Fornecedor
  FOREIGN KEY (produto_ID_produto) REFERENCES Produto(ID_produto) -- Foreign key to Produto
);

CREATE TABLE Estoque_tem_produto (
  produto_ID_produto INT,             -- Removed double quotes around table and column names
  estoque_ID_estoque INT,             -- Removed double quotes around table and column names
  quantidade INT,                     -- Stores the quantity of the product in stock
  PRIMARY KEY (produto_ID_produto, estoque_ID_estoque), -- Composite primary key
  FOREIGN KEY (produto_ID_produto) REFERENCES Produto(ID_produto), -- Foreign key to Produto
  FOREIGN KEY (estoque_ID_estoque) REFERENCES Estoque(ID_estoque) -- Foreign key to Estoque
);

CREATE TABLE Terceiro_tem_produto (
  terceiro_ID_terceiro INT,           -- Removed double quotes around table and column names
  produto_ID_produto INT,             -- Removed double quotes around table and column names
  quantidade INT,                     -- Stores the quantity managed by third-party vendors
  PRIMARY KEY (terceiro_ID_terceiro, produto_ID_produto), -- Composite primary key
  FOREIGN KEY (terceiro_ID_terceiro) REFERENCES Vendedor_terceiro(ID_terceiro), -- Foreign key to Vendedor_terceiro
  FOREIGN KEY (produto_ID_produto) REFERENCES Produto(ID_produto) -- Foreign key to Produto
);

CREATE TABLE Relacao_produto_pedido (
  produto_ID_produto INT,             -- Removed double quotes around table and column names
  pedido_ID_pedido INT,               -- Removed double quotes around table and column names
  quantidade INT,                     -- Stores the quantity of the product in the order
  PRIMARY KEY (produto_ID_produto, pedido_ID_pedido), -- Composite primary key
  FOREIGN KEY (produto_ID_produto) REFERENCES Produto(ID_produto), -- Foreign key to Produto
  FOREIGN KEY (pedido_ID_pedido) REFERENCES Pedido(ID_pedido) -- Foreign key to Pedido
); 
