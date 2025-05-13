/* Найти все заказы, сделанные клиентами из Лос-Анджелеса. Для начала нужно найти клиентов из этого города. Используем таблицу customers. */


-- Подзапрос
SELECT 
    id
FROM
    customers
WHERE
    city = 'Los Angelas';

-- Основной запрос
SELECT 
    *
FROM
    orders
WHERE
    customer_id IN (SELECT 
            id
        FROM
            customers
        WHERE
            city = 'Los Angelas');
            

/* Найти 10 продуктов, которые были заказаны больше всего, и узнать общую сумму заказов  по этим продуктам. */
SELECT 
    product_name, count_products, total_sum_products_by_orders
FROM
    (SELECT 
        product_id,
            COUNT(*) AS count_products,
            SUM(unit_price * quantity) AS total_sum_products_by_orders
    FROM
        order_details
    GROUP BY product_id
    ORDER BY count_products DESC
    LIMIT 10) AS info_by_details_orders
        JOIN
    products ON info_by_details_orders.product_id = products.id;


/* Найти среднюю цену - это одна конкретная цифра.
Сравнить столбец unit_price таблицы order_details с найденным значением. */

SELECT *
FROM order_details
WHERE unit_price >= (SELECT AVG(unit_price)
FROM order_details)
ORDER BY unit_price;


/* Найти все заказы таблица orders оформленных сотрудниками employee_id, в контактах которых таблица employees указан Sales Representative. */

SELECT 
    *
FROM
    orders
WHERE
    employee_id IN (SELECT 
            id
        FROM
            employees
        WHERE
            job_title = 'Sales Representative');

SELECT 
    id
FROM
    employees
WHERE
    job_title = 'Sales Representative';