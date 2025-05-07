SELECT 'Alex' AS name_user
UNION
SELECT 'Alex';

SELECT 'Alex' AS name_user
UNION ALL
SELECT 'Alex';


/* Выведите в одну общую выборку из таблиц customers и employees имена и фамилии клиентов и сотрудников. */

SELECT 
    last_name, first_name
FROM
    customers 
UNION ALL SELECT 
    last_name, first_name
FROM
    employees;


/* Добавьте дополнительный столбец в котором будет значение employee для сотрудника и customer для клиента. */

SELECT 
    first_name, last_name, 'customer' AS roles
FROM
    customers 
UNION ALL SELECT 
    first_name, last_name, 'employee'
FROM
    employees;
    
SELECT 
    o_d.order_id,
    o_d.product_id,
    o_d.quantity,
    o_d.unit_price,
    p.id,
    p.product_code,
    p.product_name,
    p.standard_cost,
    p.list_price
FROM
    order_details o_d
        INNER JOIN
    products p ON o_d.product_id = p.id;
    
    
/* Выведите все строки из объединенных таблиц employees и employee_privileges с помощью INNER/RIGHT и LEFT JOIN. Объясните полученные результаты. */

SELECT 
    *
FROM
    northwind.employees e
        JOIN
    northwind.employee_privileges e_p ON e.id = e_p.employee_id;
    
SELECT 
    *
FROM
    northwind.employees e
       LEFT JOIN
    northwind.employee_privileges e_p ON e.id = e_p.employee_id;
    
SELECT 
    *
FROM
    northwind.employees e
        RIGHT JOIN
    northwind.employee_privileges e_p ON e.id = e_p.employee_id;
    
    
/* Выведите идентификаторы заказов из таблицы order_details.  Дополнительно выведите вместо product_id  столбец с именем продукта product_name из products. */

SELECT 
   o_d.order_id, o_d.product_id, p.product_name
FROM
    order_details o_d
        JOIN
    products p ON o_d.product_id = p.id;