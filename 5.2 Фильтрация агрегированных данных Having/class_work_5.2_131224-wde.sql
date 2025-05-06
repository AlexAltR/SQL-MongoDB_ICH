-- Фильтрация групп по агрегатной функции
SELECT job_title, COUNT(*) AS all_customers_by_job_title
FROM customers
GROUP BY job_title
HAVING COUNT(*) > 5;

-- Фильтрация групп по столбцу
SELECT job_title, COUNT(*) AS all_customers_by_job_title
FROM customers
GROUP BY job_title
HAVING job_title != 'Accounting Manager';


-- Обращение к алиасу в нестрогом режиме
SELECT COUNT(*) AS all_customers_by_job_title, job_title
FROM customers
GROUP BY job_title
HAVING all_customers_by_job_title != 6;

-- Фильтрация групп по агрегатной функции
SELECT job_title, COUNT(*) AS all_customers_by_job_title
FROM customers
GROUP BY job_title
HAVING COUNT(*) != 6;


/* Выбрать supplier_ids для тех поставщиков, у которых количество продуктов больше 2 Используем таблицу products */
SELECT 
    supplier_ids, COUNT(*) AS all_products_by_supplier
FROM
    products
GROUP BY supplier_ids
HAVING COUNT(*) > 2;


/* Вы можете использовать несколько условий в HAVING
Сгруппировать продукты по standard_cost и list_price Посчитать количество продуктов и вывести только те данные, где количество продуктов не менее 2 */

SELECT 
    standard_cost,
    list_price,
    COUNT(*) AS count_by_standard_cost_and_list_price,
    GROUP_CONCAT(product_name
        SEPARATOR ', ') AS all_products_name_by_group
FROM
    products
GROUP BY standard_cost , list_price
HAVING COUNT(*) >= 2;



