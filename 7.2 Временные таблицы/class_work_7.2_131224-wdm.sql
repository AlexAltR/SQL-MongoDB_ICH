/* Найти все заказы, сделанные клиентами из Лос-Анджелеса. Для начала нужно найти клиентов из этого города. Используем таблицу customers. */

SELECT 
    id, first_name
FROM
    employees
WHERE
    job_title = 'Sales Representative';

WITH cte_task1 AS (SELECT 
    id, first_name
FROM
    employees
WHERE
    job_title = 'Sales Representative')
SELECT 
    *
FROM
    orders
WHERE
    employee_id IN (SELECT id FROM cte_task1);
            

/* Найти 10 продуктов, которые были заказаны больше всего, и узнать общую сумму заказов  по этим продуктам. */
WITH cte_task2 AS (SELECT 
        product_id,
            COUNT(*) AS counts_products,
            SUM(unit_price * quantity) AS total_sum_order_by_products
    FROM
        order_details
    GROUP BY product_id
    ORDER BY counts_products DESC
    LIMIT 10)

SELECT 
    p.product_name, cte2.counts_products, cte2.total_sum_order_by_products
FROM cte_task2 cte2
JOIN products p ON p.id = cte_task2.product_id;



/* Найти среднюю цену - это одна конкретная цифра.
Сравнить столбец unit_price таблицы order_details с найденным значением. */

SELECT *
FROM order_details
WHERE unit_price >= (SELECT AVG(unit_price)
FROM order_details)
ORDER BY unit_price;


/* Найти все заказы таблица orders оформленных сотрудниками employee_id, в контактах которых таблица employees указан Sales Representative. */

SELECT 
    *
FROM
    orders
WHERE
    employee_id IN (SELECT 
            id
        FROM
            employees
        WHERE
            job_title = 'Sales Representative');

SELECT 
    id
FROM
    employees
WHERE
    job_title = 'Sales Representative';