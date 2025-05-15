-- Task_1

WITH cte_customer_id  AS (SELECT 
            id
        FROM
            customers
        WHERE
            city = 'Los Angelas')
            SELECT 
    *
FROM
    orders
WHERE
    customer_id IN (SELECT id FROM cte_customer_id);



-- Task_2
WITH cte_product_summary AS (SELECT 
        product_id,
            COUNT(product_id) AS product_id_count,
            SUM(quantity * unit_price) AS sum_product_price
    FROM
        northwind.order_details
    GROUP BY product_id
    ORDER BY product_id_count DESC
    LIMIT 10)
    SELECT products.product_name,
    cte_product_summary.product_id_count,
    cte_product_summary.sum_product_price
FROM 
northwind.products
        JOIN
        cte_product_summary
        ON products.id = cte_product_summary.product_id;
        
-- Task_3
WITH avg_unit_price AS (SELECT 
            AVG(unit_price) as avg_u_price
        FROM
            northwind.order_details)

SELECT 
    *
FROM
    northwind.order_details
WHERE
    unit_price >= (SELECT 
            avg_u_price
        FROM
            avg_unit_price)
ORDER BY unit_price;

-- Task_4
WITH cte_employees_sales_representative AS (
SELECT 
            id
        FROM
            northwind.employees
        WHERE
            job_title = 'Sales Representative'
)

SELECT 
    *
FROM
    northwind.orders
WHERE
    employee_id IN (SELECT id 
    FROM
        cte_employees_sales_representative);
        

