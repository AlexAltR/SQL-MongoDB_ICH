/* Присвоить ранг продукту без пропусков значений в ранге от больше себестоимости к меньшей. Вывести ТОП 10 продуктов product_name. */

SELECT 
    product_name,
    DENSE_RANK() OVER (ORDER BY standard_cost DESC) AS product_name_rank
FROM
    northwind.products
LIMIT 10;


/* Пронумеровать строки в таблице в зависимости от названия товара от A до Z. */

SELECT 
    product_name,
    ROW_NUMBER() OVER (ORDER BY product_name ) AS row_num
FROM
    northwind.products;
    
/* Разделить все продукты на 4 равных группы в зависимости от list_price. 
Вывести имя продукта, list_price и номер группы. */

SELECT 
    product_name,
    list_price,
    NTILE(4) OVER (ORDER BY list_price ) AS tile_num
FROM
    northwind.products;
    
