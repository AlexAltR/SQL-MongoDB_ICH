SELECT * FROM northwind.employees;


SELECT 
    job_title, GROUP_CONCAT(first_name) AS employees, COUNT(id) AS count_employees_by_job_title
FROM
    employees
GROUP BY job_title
ORDER BY count_employees_by_job_title DESC;


/* Найдите общее количество товаров quantity в таблице order_details. */

SELECT 
    SUM(quantity) AS sum_quantity
FROM
    order_details;

/* Посчитайте количество уникальных order_id в таблице order_details. */
SELECT 
    COUNT(DISTINCT order_id)
FROM
    order_details;

/* Перечислите через запятую имена всех сотрудников из таблицы employees. */

SELECT 
    GROUP_CONCAT(first_name SEPARATOR ', ') AS all_first_name
FROM
    employees;


/* Выведите среднее, минимум и макисиму столбца unit_price таблицы order_details. */
SELECT 
    AVG(unit_price) AS avg_unit_price,
    MIN(unit_price) AS min_unit_price,
    MAX(unit_price) AS max_unit_price
FROM
    order_details;
    
/* Из таблицы employees посчитать количество сотрудников в каждом городе city.
Отсортировать результаты по убыванию. */

SELECT 
    COUNT(id) AS employees
FROM
    employees;
    
SELECT 
    city, COUNT(id) AS count_employees_by_city
FROM
    employees
GROUP BY city
ORDER BY count_employees_by_city DESC;



/* Посчитать общее количество продуктов из таблицы order_details для каждого заказа.
Отсортировать по убыванию общего количества продуктов. Для краткости записи в GROUP BY можно не указывать конкретное имя колонки, а указать ее порядковый номер в SELECT.
Сделать то же самое  в ORDER BY. */

SELECT 
    order_id, SUM(quantity) AS total_quantity_by_order
FROM
    order_details
GROUP BY order_id
ORDER BY total_quantity_by_order DESC;


-- Разбор GROUP BY

SELECT 
    id, order_id, COUNT(*)
FROM
    order_details;

SELECT 
    order_id, COUNT(*), SUM(quantity)
FROM
    order_details
GROUP BY order_id;




