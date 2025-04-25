SELECT quantity, unit_price, quantity * unit_price AS summary
FROM order_details;


SELECT first_name, last_name
FROM employees
WHERE (first_name LIKE '%e%' OR first_name LIKE 'E%') AND last_name LIKE '%e%';

-- '% %'

SELECT id, first_name, last_name, company, city, notes
FROM employees
WHERE notes IS NOT NULL;

