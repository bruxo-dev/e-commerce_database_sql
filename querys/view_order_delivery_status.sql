SELECT 
    PED.ID_pedido AS Order_ID, 
    PED.descricao AS Order_Description, 
    PED.status AS Order_Status, 
    E.status AS Delivery_Status, 
    E.codigo_rastreio AS Tracking_Code
FROM 
    Pedido PED
LEFT JOIN 
    Entrega E ON PED.ID_pedido = E.pedido_ID_pedido;
