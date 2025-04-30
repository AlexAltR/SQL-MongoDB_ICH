/*
Выведите информацию о каждом заказе, включая идентификатор заказа OrderID, расчетную полную стоимость заказа после применения скидки NetPrice.
Таблица: OrderDetails
*/

SELECT 
    order_id,
    (quantity * unit_price) AS total_price,
    (quantity * unit_price * discount) AS discount,
    (quantity * unit_price) - (quantity * unit_price * discount) AS net_price
FROM
    order_details;
    
/*
Ситуация: У вас есть числовые данные, которые хранятся в текстовом формате. Например, количество товаров на складе.
Проблема: Вы хотите рассчитать общую стоимость товаров на складе. Если количество товаров хранится как текст, вы не сможете сделать расчет.
*/

SELECT 
    product_name,
    standard_cost,
    unit_in_stock,
    CAST(unit_in_stock AS DECIMAL (10 , 2 )) AS transformation,
    CAST(unit_in_stock AS DECIMAL (10 , 2 )) * standard_cost AS total_price
FROM
    products;
    
    
SELECT '123' + 1;

SELECT TRUE + 1;

SELECT '3.1.4text' + 1;

