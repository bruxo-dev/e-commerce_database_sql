-- Populating Fornecedor table
INSERT INTO Fornecedor (ID_fornecedor, razao_social, CNPJ) VALUES
(1, 'Fornecedor A', '00.000.000/0001-01'),
(2, 'Fornecedor B', '00.000.000/0002-02'),
(3, 'Fornecedor C', '00.000.000/0003-03'),
(4, 'Fornecedor D', '00.000.000/0004-04'),
(5, 'Fornecedor E', '00.000.000/0005-05');

-- Populating Produto table
INSERT INTO Produto (ID_produto, categoria, descricao, valor) VALUES
(1, 'Eletrônicos', 'Smartphone X', 999.90),
(2, 'Eletrônicos', 'Laptop Y', 1499.90),
(3, 'Eletrônicos', 'Tablet Z', 599.90),
(4, 'Móveis', 'Cadeira Gamer', 199.90),
(5, 'Móveis', 'Mesa Escritório', 299.90);

-- Populating Estoque table
INSERT INTO Estoque (ID_estoque, local) VALUES
(1, 'Armazém Central'),
(2, 'Depósito Norte'),
(3, 'Depósito Sul'),
(4, 'Loja Centro'),
(5, 'Loja Subúrbio');

-- Populating Vendedor_terceiro table
INSERT INTO Vendedor_terceiro (ID_terceiro, razao_social, local) VALUES
(1, 'Parceiro A', 'São Paulo'),
(2, 'Parceiro B', 'Rio de Janeiro'),
(3, 'Parceiro C', 'Belo Horizonte'),
(4, 'Parceiro D', 'Curitiba'),
(5, 'Parceiro E', 'Porto Alegre');

-- Populating Cliente table
INSERT INTO Cliente (ID_cliente, nome, identificacao, endereco, tipo) VALUES
(1, 'Carlos Silva', '12345678900', 'Rua A, 123', 'PF'),
(2, 'Joana Souza', '98765432100', 'Rua B, 456', 'PF'),
(3, 'Empresa X', '00.123.456/0001-00', 'Av. C, 789', 'PJ'),
(4, 'Empresa Y', '00.987.654/0002-00', 'Av. D, 101', 'PJ'),
(5, 'Luiza Martins', '45612378900', 'Rua E, 202', 'PF');

-- Populating Pedido table
INSERT INTO Pedido (ID_pedido, status, descricao, cliente_ID_cliente, frete) VALUES
(1, 'Pendente', 'Pedido de Smartphone X', 1, 20.00),
(2, 'Concluído', 'Pedido de Laptop Y', 2, 25.00),
(3, 'Pendente', 'Pedido de Tablet Z', 3, 15.00),
(4, 'Cancelado', 'Pedido de Cadeira Gamer', 4, 30.00),
(5, 'Pendente', 'Pedido de Mesa Escritório', 5, 35.00);

-- Populating Entrega table
INSERT INTO Entrega (ID_entrega, status, codigo_rastreio, pedido_ID_pedido) VALUES
(1, 'Em Trânsito', 'RA123456789BR', 1),
(2, 'Entregue', 'RA987654321BR', 2),
(3, 'Pendente', 'RA456123789BR', 3),
(4, 'Cancelado', 'RA321987654BR', 4),
(5, 'Pendente', 'RA654789123BR', 5);

-- Populating Forma_Pagamento table
INSERT INTO Forma_Pagamento (ID_forma_pagamento, descricao) VALUES
(1, 'Cartão de Crédito'),
(2, 'Boleto Bancário'),
(3, 'Pix'),
(4, 'Transferência Bancária'),
(5, 'Dinheiro');

-- Populating Pagamento table
INSERT INTO Pagamento (ID_pagamento, pedido_ID_pedido, forma_pagamento_ID, valor) VALUES
(1, 1, 1, 1019.90),
(2, 2, 2, 1524.90),
(3, 3, 3, 614.90),
(4, 4, 4, 229.90),
(5, 5, 5, 334.90);

-- Populating Fornecedor_tem_produto table
INSERT INTO Fornecedor_tem_produto (fornecedor_ID_fornecedor, produto_ID_produto) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Populating Estoque_tem_produto table
INSERT INTO Estoque_tem_produto (produto_ID_produto, estoque_ID_estoque, quantidade) VALUES
(1, 1, 50),
(2, 2, 30),
(3, 3, 40),
(4, 4, 20),
(5, 5, 25);

-- Populating Terceiro_tem_produto table
INSERT INTO Terceiro_tem_produto (terceiro_ID_terceiro, produto_ID_produto, quantidade) VALUES
(1, 1, 10),
(2, 2, 15),
(3, 3, 12),
(4, 4, 8),
(5, 5, 5);

-- Populating Relacao_produto_pedido table
INSERT INTO Relacao_produto_pedido (produto_ID_produto, pedido_ID_pedido, quantidade) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1);
