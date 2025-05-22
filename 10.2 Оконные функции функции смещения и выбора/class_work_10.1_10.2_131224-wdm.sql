-- Присвоить ранг продукту без пропусков значений в ранге от больше себестоимости к меньшей. Вывести ТОП 10 продуктов product_name.

SELECT product_name,standard_cost, DENSE_RANK() OVER (ORDER BY standard_cost DESC) AS dense_rank_products_by_standart_cost
FROM products
LIMIT 10;


-- Пронумеровать строки в таблице в зависимости от названия товара от A до Z.
SELECT product_name,
ROW_NUMBER() OVER (ORDER BY product_name) AS sequence_number_by_product_name
FROM products;

-- Разделить все продукты на 4 равных группы в зависимости от list_price. Вывести имя продукта, list_price и номер группы.
SELECT product_name, list_price,
NTILE(4) OVER (ORDER BY list_price) AS products_group_by_list_price
FROM products;



-- Важная запись, которая явно указывает на использование всех строк в окне
-- ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING

-- ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW


/* Из таблицы purchase_orders для каждого поставщика supplier_id выведите дату создания заказа, а также дату создания предыдущего заказа. Посчитайте разницу между этим датами. */

SELECT submitted_date, created_by,
MIN(submitted_date) OVER (PARTITION BY created_by) AS min_submitted_date,
FIRST_VALUE(submitted_date) OVER (PARTITION BY created_by ORDER BY submitted_date ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS first_value_submitted_date
FROM purchase_orders;