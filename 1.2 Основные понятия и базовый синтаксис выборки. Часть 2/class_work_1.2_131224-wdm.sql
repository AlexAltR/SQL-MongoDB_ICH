-- 1.Выбрать все строки с ценой единицы товара unit price превышающей 20
USE northwind;
SELECT 
    *
FROM
    order_details
WHERE
    unit_price > 20;
    
    
/*2.Выбрать идентификаторы заказов order_id, если в заказе был продукт product_id  равный 43 и статус заказа status_id равен 2*/

SELECT 
    order_id, product_id, status_id
FROM
    order_details
WHERE
    product_id = 43 AND status_id = 2;
    
/*3. Выбрать всех сотрудников с именами на букву А */
SELECT 
    *
FROM
    employees;

SELECT 
    first_name
FROM
    employees
WHERE
    first_name LIKE 'A%';