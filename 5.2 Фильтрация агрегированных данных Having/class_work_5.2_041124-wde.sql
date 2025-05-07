-- Выбрать supplier_ids для тех поставщиков, у которых количество продуктов больше 2 Используем таблицу products

SELECT 
    supplier_ids
FROM
    products
GROUP BY supplier_ids
HAVING COUNT(id) > 2;

SELECT 
    supplier_ids
FROM
    products
GROUP BY supplier_ids
HAVING COUNT(id) <= 2;


/* Вы можете использовать несколько условий в HAVING
Сгруппировать продукты по standard_cost и list_price Посчитать количество продуктов и вывести только те данные, где количество продуктов не менее 2 */

SELECT 
    standard_cost, list_price, COUNT(product_name)
FROM
    northwind.products
GROUP BY standard_cost , list_price
HAVING COUNT(product_name) > 1;


/* Часто HAVING и WHERE используются вместе, чтобы максимально сузить набор данных перед тем, как применять агрегатные функции и группировку.
Выбрать только те продукты в quantity_per_unit встречается слово 'oz' как в нижнем так и в верхнем регистрах Сгруппировать по standard_cost Оставить только данные где количество продуктов не менее 3 */


SELECT 
    standard_cost, COUNT(id)
FROM
    northwind.products
WHERE
    LOWER(quantity_per_unit) LIKE '%oz%'
GROUP BY standard_cost
HAVING COUNT(id) >= 3;
