SELECT 
    P.descricao AS Product_Description, 
    E.local AS Stock_Location, 
    SUM(EP.quantidade) AS Stock_Quantity, 
    V.razao_social AS Vendor_Name, 
    SUM(TP.quantidade) AS Vendor_Quantity
FROM 
    Produto P
LEFT JOIN 
    Estoque_tem_produto EP ON P.ID_produto = EP.produto_ID_produto
LEFT JOIN 
    Estoque E ON EP.estoque_ID_estoque = E.ID_estoque
LEFT JOIN 
    Terceiro_tem_produto TP ON P.ID_produto = TP.produto_ID_produto
LEFT JOIN 
    Vendedor_terceiro V ON TP.terceiro_ID_terceiro = V.ID_terceiro
GROUP BY 
    P.descricao, E.local, V.razao_social;
