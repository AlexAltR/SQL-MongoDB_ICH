
SELECT *
FROM customers
WHERE MAX(id) = 29;


SELECT MAX(list_price) AS avg_list_price
FROM products;

SELECT MAX(list_price) AS avg_list_price
FROM products
WHERE MAX(list_price) = 81.0000;


SELECT -- 5
    job_title, COUNT(*) AS count_rows
FROM -- 1
    customers
WHERE -- 2
    country_region = 'USA'
GROUP BY job_title -- 3
HAVING COUNT(*) > 2 -- 4
ORDER BY count_rows DESC -- 6
LIMIT 1, 2; -- OFFSET 1, LIMIT 2
-- Полная запись LIMIT 2 OFFSET 1; -- 7


/* Вычислите суммарную прибыль компании для каждой категории для продуктов с target_level больше 40 Прибыль компании вычисляется как list_price - standard_cost */

