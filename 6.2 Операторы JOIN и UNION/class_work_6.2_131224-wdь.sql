SELECT 'Alexandr' AS my_name, 10 + 17 AS sum_nums, 10 * 17 AS multi_nums
UNION ALL
SELECT 'Alexandr', 10 + 17, 10 * 17
UNION ALL
SELECT 'Alexandr', 10 + 17, 10 * 17;


/* Выведите в одну общую выборку из таблиц customers и employees имена и фамилии клиентов и сотрудников. */

SELECT 
    first_name, last_name
FROM
    customers 
UNION ALL SELECT 
    first_name, last_name
FROM
    employees;
    
/* Добавьте дополнительный столбец в котором будет значение employee для сотрудника и customer для клиента. */

SELECT 
    first_name, last_name, 'customer' AS role
FROM
    customers 
UNION ALL SELECT 
    first_name, last_name, 'employee'
FROM
    employees;
    

-- Пример работы с INNER JOIN

SELECT 
    o_d.id,
    o_d.order_id,
    o_d.quantity,
    o_d.unit_price,
    o_d.discount,
    o.id,
    o.order_date,
    o.shipped_date
FROM
    order_details o_d
        JOIN
    orders o ON o_d.order_id = o.id;


/* Выведите все строки из объединенных таблиц employees и employee_privileges с помощью INNER/RIGHT и LEFT JOIN. Объясните полученные результаты. */

SELECT *
FROM employees e
INNER JOIN employee_privileges ep
ON ep.employee_id = e.id;

SELECT *
FROM employees e
RIGHT JOIN employee_privileges ep
ON ep.employee_id = e.id;


SELECT *
FROM employees e
LEFT JOIN employee_privileges ep
ON ep.employee_id = e.id;