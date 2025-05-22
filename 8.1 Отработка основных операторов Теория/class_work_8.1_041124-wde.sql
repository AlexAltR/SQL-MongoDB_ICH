-- Task_1
SELECT 
    id
FROM
    customers
WHERE
    city = 'Los Angelas';

SELECT 
    *
FROM
    orders
WHERE
    customer_id IN (SELECT 
            id
        FROM
            customers
        WHERE
            city = 'Los Angelas');

-- Task_2            
SELECT 
    product_id, COUNT(*) AS count_products, SUM(quantity * unit_price) AS sum_by_orders
FROM
    order_details
GROUP BY product_id
ORDER BY count_products DESC
LIMIT 10;

SELECT 
    product_name, count_products, sum_by_orders
FROM
    (SELECT 
        product_id,
            COUNT(*) AS count_products,
            SUM(quantity * unit_price) AS sum_by_orders
    FROM
        order_details
    GROUP BY product_id
    ORDER BY count_products DESC
    LIMIT 10) AS info_by_datails_orders
JOIN products p
ON info_by_datails_orders.product_id = p.id;


-- Task_3
SELECT *
FROM order_details
WHERE unit_price > (SELECT AVG(unit_price) FROM order_details);


SELECT id
FROM employees
WHERE job_title = 'Sales Representative';

-- Task_4
SELECT *
FROM orders
WHERE employee_id IN (SELECT id
FROM employees
WHERE job_title = 'Sales Representative');


-- Работа со временными таблицами
WITH subquery_task1 AS (
SELECT 
            id
        FROM
            customers
        WHERE
            city = 'Los Angelas'
)

SELECT 
    *
FROM
    orders
WHERE
    customer_id IN (SELECT 
            id
        FROM
            subquery_task1);

-- Task_2
WITH subquery_task_2 AS (
	SELECT 
        product_id,
            COUNT(*) AS count_products,
            SUM(quantity * unit_price) AS sum_by_orders
    FROM
        order_details
    GROUP BY product_id
    ORDER BY count_products DESC
    LIMIT 10
)

SELECT 
    product_name, count_products, sum_by_orders
FROM
    (SELECT product_id, count_products, sum_by_orders FROM subquery_task_2) AS info_by_datails_orders
JOIN products p
ON info_by_datails_orders.product_id = p.id;


-- Task_3

WITH subquery_task_3 AS (
	SELECT AVG(unit_price) AS avg_unit_price FROM order_details
)

SELECT *
FROM order_details
WHERE unit_price > (SELECT avg_unit_price FROM subquery_task_3);


-- Task_4

WITH subquery_task_4 AS (
	SELECT id
	FROM employees
	WHERE job_title = 'Sales Representative'
)

SELECT *
FROM orders
WHERE employee_id IN (SELECT id FROM subquery_task_4);


