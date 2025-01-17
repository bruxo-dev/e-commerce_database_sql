SELECT 
    E.local AS Stock_Location, 
    P.descricao AS Product_Description, 
    EP.quantidade AS Quantity_Available
FROM 
    Estoque E
JOIN 
    Estoque_tem_produto EP ON E.ID_estoque = EP.estoque_ID_estoque
JOIN 
    Produto P ON EP.produto_ID_produto = P.ID_produto;
