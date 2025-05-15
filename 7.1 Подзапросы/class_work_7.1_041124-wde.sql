/* Найти все заказы, сделанные клиентами из Лос-Анджелеса. */

SELECT 
    *
FROM
    northwind.orders
WHERE
    orders.customer_id IN (SELECT 
            id
        FROM
            northwind.customers
        WHERE
            customers.city = 'Los Angelas');
            
/* Найти 10 продуктов, которые были заказаны больше всего, и узнать общую сумму заказов  по этим продуктам. */

SELECT 
    products.product_name,
    temp_table.product_id_count,
    temp_table.sum_product_price
FROM
    northwind.products
        JOIN
    (SELECT 
        product_id,
            COUNT(product_id) AS product_id_count,
            SUM(quantity * unit_price) AS sum_product_price
    FROM
        northwind.order_details
    GROUP BY product_id
    ORDER BY product_id_count DESC
    LIMIT 10) AS temp_table ON products.id = temp_table.product_id;
    
    
    
/* Найти среднюю цену - это одна конкретная цифра.
Сравнить столбец unit_price таблицы order_details с найденным значением. */

SELECT 
    AVG(unit_price)
FROM
    order_details;

SELECT 
    *
FROM
    order_details
WHERE
    unit_price >= (SELECT 
            AVG(unit_price)
        FROM
            order_details)
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


