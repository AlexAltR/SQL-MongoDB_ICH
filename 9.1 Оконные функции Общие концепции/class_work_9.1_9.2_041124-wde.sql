
-- Работаем с GROUP BY
SELECT 
    supplier_ids,
    standard_cost,
    AVG(standard_cost) AS avg_standard_cost_by_supplier,
    COUNT(*) AS count_products_by_supplier
FROM
    products
GROUP BY supplier_ids;


-- Оконные функции
SELECT 
    supplier_ids,
    standard_cost,
    AVG(standard_cost) OVER (PARTITION BY supplier_ids) AS avg_standard_cost_by_supplier,
    COUNT(*) OVER (PARTITION BY supplier_ids) AS count_products_by_supplier
    -- AVG(standard_cost) AS avg_standard_cost_by_supplier,
    -- COUNT(*) AS count_products_by_supplier
FROM
    products;
-- GROUP BY supplier_ids


/* Для каждого клиента посчитать общую сумму всех его заказов. */


SELECT OrderID, CustomerID, OrderAmount, SUM(OrderAmount) OVER (PARTITION BY CustomerID) AS sum_orders_by_customer
FROM orders;

/* Подсчитать количество заказов для каждого клиента. */

SELECT OrderID, CustomerID, OrderAmount, COUNT(*) OVER (PARTITION BY CustomerID) AS number_of_orders_by_CustomerID
FROM orders;

/* Из таблицы products выведите максимальный list_price для каждой строки, имя продукта и его list_price.*/

SELECT product_name, list_price, MAX(list_price) OVER() AS max_list_price
FROM products
ORDER BY list_price DESC;

/* Используя предыдущий запрос, посчитайте разницу в процентах между ценой продукта и максимальной ценой. */
SELECT 
MAX(list_price) OVER () as max_list_price, 
product_name, 
list_price, 
(MAX(list_price) OVER ()-list_price) * 100/MAX(list_price) OVER () as percent_list_price
FROM
    northwind.products
    ORDER BY list_price DESC;
    
    
/* Посчитайте количество продуктов в каждой категории с помощью оконной функции. Оптимально ли использование оконной функции для выполнения этого задания. */


SELECT DISTINCT category,
    COUNT(*) OVER (PARTITION BY category)
    FROM products;
    
SELECT 
    category, COUNT(*)
FROM
    products
GROUP BY category;

/* Найдите разницу между standard_cost продукта и средним list_price по всей таблицы для каждой строки. */

SELECT product_name, standard_cost, AVG(list_price) OVER(),
standard_cost - AVG(list_price) OVER() AS diff_between_standard_cost_avg_list_price
FROM products;


/* Можно ли решить предыдущее задание без оконных функций. */

WITH avg_price AS (
	SELECT AVG(list_price) AS avg_lp
    FROM products
)
SELECT products.product_name, avg_price.avg_lp,
products.standard_cost - avg_price.avg_lp
FROM products
JOIN avg_price
ON 1=1;

WITH avg_price AS (
	SELECT AVG(list_price) AS avg_lp
    FROM products
)
SELECT products.product_name, avg_price.avg_lp,
products.standard_cost - avg_price.avg_lp
FROM products
CROSS JOIN avg_price;


-- Рассчитать кумулятивную сумму продаж по датам.

SELECT *,  SUM(SaleAmount) OVER (ORDER BY SaleDate) AS cumm_sum_sales
FROM sale;

-- Рассчитать текущее среднее значение суммы заказов для каждого клиента.

SELECT 
	CustomerID, 
	OrderDate, 
	AVG(SaleAmount) OVER (PARTITION BY CustomerID ORDER BY OrderDate, OrderID) AS cumm_avg_sales
FROM Sales;