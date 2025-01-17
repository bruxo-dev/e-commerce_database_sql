SELECT 
    V.razao_social AS Vendor_Name, 
    P.descricao AS Product_Description, 
    SUM(TP.quantidade) AS Total_Quantity
FROM 
    Vendedor_terceiro V
JOIN 
    Terceiro_tem_produto TP ON V.ID_terceiro = TP.terceiro_ID_terceiro
JOIN 
    Produto P ON TP.produto_ID_produto = P.ID_produto
GROUP BY 
    V.razao_social, P.descricao;
