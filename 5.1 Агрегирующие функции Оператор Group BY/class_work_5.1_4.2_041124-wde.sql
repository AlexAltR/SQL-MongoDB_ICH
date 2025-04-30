SELECT 
    job_title,
    GROUP_CONCAT(first_name
        SEPARATOR ', ') AS employees
FROM
    employees
GROUP BY job_title;


SELECT 
    COUNT(customer_id) AS sum_rows_by_customer_id,
    COUNT(DISTINCT customer_id) AS sum_rows_by_customer_id_unique
FROM
    northwind.orders
ORDER BY customer_id;

/* Найдите общее количество товаров quantity в таблице order_details. */

SELECT 
    SUM(quantity) AS quantity_sum
FROM
    northwind.order_details;
    
/* Посчитайте количество уникальных order_id в таблице order_details. */
SELECT 
    COUNT(DISTINCT order_id) AS count_uniq_order_id
FROM
    order_details;
    
/* Перечислите через запятую имена всех сотрудников из таблицы employees. */

SELECT 
    GROUP_CONCAT(first_name
        SEPARATOR ', ') AS names_employees
FROM
    employees;
    
/* Выведите среднее, минимум и макисиму столбца unit_price таблицы order_details. */

SELECT 
    AVG(unit_price) AS unit_price_avg,
    MIN(unit_price) AS unit_price_min,
    MAX(unit_price) AS unit_price_max
FROM
    northwind.order_details;
    


SELECT 
    job_title,
    COUNT(first_name) AS count_employees_by_job_title
FROM
    employees
GROUP BY job_title;


/* Из таблицы employees посчитать количество сотрудников в каждом городе city. */
/* Отсортировать результаты по убыванию. */

SELECT 
    city, COUNT(id) AS totel_employees_by_city
FROM
    northwind.employees
GROUP BY city
ORDER BY totel_employees_by_city DESC;

/* Посчитать общее количество продуктов из таблицы order_details для каждого заказа.
Отсортировать по убыванию общего количества продуктов. Для краткости записи в GROUP BY можно не указывать конкретное имя колонки, а указать ее порядковый номер в SELECT.
Сделать то же самое  в ORDER BY. */


SELECT 
    order_id, SUM(quantity) AS total_products
FROM
    order_details
GROUP BY order_id
ORDER BY total_products DESC;

/* Посчитать количество сотрудников в разрезе компании и занимаемой должности из таблицы employees. */


SELECT 
    company,
    job_title,
    COUNT(id) AS count_employees_by_job_title_by_company
FROM
    northwind.employees
GROUP BY company , job_title;

