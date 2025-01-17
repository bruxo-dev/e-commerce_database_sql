SELECT 
    PAG.ID_pagamento AS Payment_ID, 
    PAG.valor AS Payment_Amount, 
    PED.descricao AS Order_Description, 
    FP.descricao AS Payment_Type
FROM 
    Pagamento PAG
JOIN 
    Pedido PED ON PAG.pedido_ID_pedido = PED.ID_pedido
JOIN 
    Forma_Pagamento FP ON PAG.forma_pagamento_ID = FP.ID_forma_pagamento;
