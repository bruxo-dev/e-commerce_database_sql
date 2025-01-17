SELECT 
    P.ID_produto AS Product_ID, 
    P.descricao AS Product_Description, 
    F.razao_social AS Supplier_Name
FROM 
    Produto P
JOIN 
    Fornecedor_tem_produto FP ON P.ID_produto = FP.produto_ID_produto
JOIN 
    Fornecedor F ON FP.fornecedor_ID_fornecedor = F.ID_fornecedor;
