/*
Напишите запрос для сортировки списка продуктов по убыванию standard_cost. 
Таблица products.
*/


SELECT product_code, product_name, category, standard_cost, list_price 
FROM products
ORDER BY category ASC, standard_cost DESC, list_price DESC;


/*
Напишите запрос для сортировки  списка клиентов по компании и затем по городу по возрастанию.
*/

SELECT 
    first_name, last_name, company, city
FROM
    customers
ORDER BY company , city;


/*
Напишите запрос для выбора пяти самых дешевых продуктов standard_cost из таблицы products.
*/
SELECT 
    product_code, product_name, standard_cost
FROM
    products
WHERE
    standard_cost > 10
ORDER BY standard_cost
LIMIT 5;

/*
Предположим, что в products данные из интернет-магазина, где ассортимент продуктов выводится покупателю по страницам, отсортированный от А до Z по 10 продуктов на страницу. 
Составьте запрос, который выведет этот список.
*/

SELECT 
    product_code, product_name, list_price
FROM
    products
ORDER BY product_name
LIMIT 10 OFFSET 20;


-- DISTINCT

SELECT DISTINCT category, standard_cost
FROM products
ORDER BY category, standard_cost DESC;

/*Составьте запрос для выбора уникальных городов, в которых находятся клиенты.
Таблица customers.
*/

SELECT DISTINCT
    city
FROM
    customers
ORDER BY city;



