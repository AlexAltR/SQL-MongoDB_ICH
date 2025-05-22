-- Применяем GROUP BY
SELECT 
    supplier_ids,
    AVG(standard_cost) AS avg_standard_cost_by_supplier,
    COUNT(*) AS count_products
FROM
    products
GROUP BY supplier_ids
ORDER BY avg_standard_cost_by_supplier DESC;

-- Применяем оконные функции
SELECT 
    supplier_ids,
    standard_cost, 
    list_price,
    AVG(standard_cost) OVER (partition by supplier_ids) AS avg_standard_cost_by_supplier,
    COUNT(*) OVER (partition by supplier_ids) AS count_products
    -- AVG(standard_cost) AS avg_standard_cost_by_supplier,
    -- COUNT(*) AS count_products
FROM
    products
-- GROUP BY supplier_ids
ORDER BY avg_standard_cost_by_supplier DESC;

/* Из таблицы order_details узнать среднее кол-во заказанного товара в рамках одного заказа. Сделать это с помощью двух способов. С помощью group by. С помощью оконных функций */

SELECT 
    order_id,
    AVG(quantity) AS avg_quntity_by_products,
    COUNT(*) AS count_products
FROM
    order_details
GROUP BY order_id
ORDER BY order_id;


SELECT 
    order_id,
    AVG(quantity) over (partition by order_id) AS average_quantity_by_orders,
    COUNT(*) over (partition by order_id) AS count_products
FROM
    order_details
ORDER BY average_quantity_by_orders;


/* В таблице products. Посчитать сумму продуктов в продаже по категориям. Применяя оконную функцию. Вывести имя продукта, категорию */
SELECT product_name, category, SUM(list_price) OVER (PARTITION BY category) AS sum_of_products_by_category
FROM products;


