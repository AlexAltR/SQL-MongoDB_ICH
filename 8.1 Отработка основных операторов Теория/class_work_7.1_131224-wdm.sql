SELECT 
    *
FROM
    customers
WHERE
    ((job_title = 'Owner'
        AND first_name LIKE 'A%')
        OR (city = 'Los Angelas'))
        AND id % 2 = 1;

SELECT 
    *
FROM
    customers
WHERE
    job_title = 'Purchasing Manager'
ORDER BY city ASC
LIMIT 5 OFFSET 5;

SELECT unit_price
FROM order_details;

SELECT MIN(unit_price) AS min_unit_price
FROM order_details;

SELECT unit_price
FROM order_details
ORDER BY unit_price
LIMIT 1;

SELECT first_name, last_name, 'customers' AS roles
FROM customers
UNION ALL
SELECT first_name, last_name, 'employees'
FROM employees;

SELECT p.product_name, o_d.product_id, o.id AS order_id
FROM products p
JOIN order_details o_d
ON p.id = o_d.product_id
JOIN orders o
ON o_d.order_id = o.id;


SELECT p.product_name, o_d.product_id
FROM products p
LEFT JOIN order_details o_d
ON p.id = o_d.product_id;
