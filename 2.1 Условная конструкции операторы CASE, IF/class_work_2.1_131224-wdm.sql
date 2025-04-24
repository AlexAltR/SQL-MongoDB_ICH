SELECT 
	state_province,
    'Hello world' AS str,
	CASE
		WHEN state_province = 'NY' THEN 'New York'
        WHEN state_province = 'CA' THEN 'California'
        ELSE 'unknow'
    END AS condition_constraction
FROM customers;

SELECT 5 + 5 AS math_plus;



/*
Составьте запрос чтобы: классифицировать товары таблицы products по их стоимости standard_cost, присваивая каждому из них категорию:

"Дорогой" от 50
"Средний" от 20 до 50 включая 50 
"Дешевый" до 20 включительно
*/
SELECT product_name, standard_cost,
	CASE
		WHEN standard_cost > 50 THEN 'Дорогой'
		WHEN standard_cost > 20 AND standard_cost <= 50 THEN 'Средний'
		ELSE 'Дешевый'
	END AS price_category
FROM products;


/*
Составьте запрос чтобы: вывести имя продукта из таблицы products и его категорию.
standard_cost > 20 - 'Expensive'. 
В обратном случае - 'Affordable' с применением оператора IF.
*/

SELECT 
    product_name,
    standard_cost,
    IF(standard_cost > 20,
        'Expensive',
        'Affordable') AS price_category
FROM
    products;
    
    
/*
Составьте запрос чтобы: выбрать полное имя состоящее из имени и фамилии.
Таблица employees.
*/

SELECT first_name, last_name, CONCAT(first_name, ' ', last_name) AS full_name
FROM employees;

/*
В таблице employees замените все пропуски в столбце notes на значение 'Not filled'.
Выведите полученный столбец и столбец notes.
*/

SELECT notes, COALESCE(notes, 'Not filled') AS notes_is_not_null
FROM employees;

