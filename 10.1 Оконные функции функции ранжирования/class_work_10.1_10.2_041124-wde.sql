/* Для каждого клиента посчитать общую сумму всех его заказов. */

SELECT customer_id,
SUM(order_amount) OVER (PARTITION BY customer_id) AS sum_of_orders
FROM name_table;


/* Подсчитать количество заказов для каждого клиента. */

SELECT OrderID, customerID, OrderAmount,
COUNT(OrderID) OVER (PARTITION BY customerID) AS all_orders_by_customers
FROM name_table;


/* Из таблицы products выведите максимальный list_price для каждой строки, имя продукта и его list_price. */

SELECT product_name, list_price, MAX(list_price) OVER () AS max_list_price
FROM products
ORDER BY list_price DESC;


/* Используя предыдущий запрос, посчитайте разницу в процентах между ценой продукта и максимальной ценой. */

SELECT product_name, list_price, ((MAX(list_price) OVER() - list_price) / MAX(list_price) OVER()) * 100 AS deff_prec_between_max_and_list_price
FROM products
ORDER BY list_price DESC;

/* Найдите разницу между standard_cost продукта и средним list_price по всей таблицы для каждой строки. */

SELECT product_name, standard_cost, AVG(list_price) OVER(), standard_cost - AVG(list_price) OVER () AS diff_price 
FROM products;


/* Рассчитать кумулятивную сумму продаж по датам. */

SELECT SaleID, SaleDate, SaleAmount,
	SUM(SaleAmount) OVER (ORDER BY SaleDate) AS CumulSum
FROM sales;
