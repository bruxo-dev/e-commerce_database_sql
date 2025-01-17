SELECT 
    PED.ID_pedido AS Order_ID, 
    PED.descricao AS Order_Description, 
    P.descricao AS Product_Description, 
    RP.quantidade AS Quantity
FROM 
    Pedido PED
JOIN 
    Relacao_produto_pedido RP ON PED.ID_pedido = RP.pedido_ID_pedido
JOIN 
    Produto P ON RP.produto_ID_produto = P.ID_produto;
