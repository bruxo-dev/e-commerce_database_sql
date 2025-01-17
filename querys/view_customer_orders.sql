SELECT 
    C.ID_cliente AS Customer_ID, 
    C.nome AS Customer_Name, 
    C.tipo AS Customer_Type, 
    PED.ID_pedido AS Order_ID, 
    PED.descricao AS Order_Description, 
    PED.frete AS Shipping_Cost
FROM 
    Cliente C
LEFT JOIN 
    Pedido PED ON C.ID_cliente = PED.cliente_ID_cliente;
