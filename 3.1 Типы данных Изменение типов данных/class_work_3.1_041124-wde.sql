/*
Выведите информацию о каждом заказе, включая идентификатор заказа OrderID, расчетную полную стоимость заказа после применения скидки NetPrice.
*/

SELECT 
    *
FROM
    northwind.order_details;
SELECT 
    order_id,
    (quantity * unit_price) - (quantity * unit_price * discount) AS price_after_discount
FROM
    order_details;
    
/*
Выведите полный адрес каждого клиента, объединяя адрес Address, город City и страну Country в одну строку.
*/

SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name,
    CONCAT(address,
            ', ',
            city,
            ', ',
            state_province,
            ', ',
            country_region) AS address
FROM
    customers;
    
    


/*
Выведите информацию о каждом сотруднике, включая идентификатор сотрудника EmployeeID, имя FirstName, фамилию LastName и роль Role, где роль определяется на основе значения поля IsManager (если значение 1, то "Manager", иначе "Employee").
*/

SELECT 
    id,
    first_name,
    last_name,
    IF(is_manager = 1,
        'Manager',
        'Employee') AS employee_role
FROM
    northwind.employees;
    
    
    
/*
Ситуация: 
У вас есть числовые данные, которые хранятся в текстовом формате. Например, количество товаров на складе.
Проблема: 
Вы хотите рассчитать общую стоимость товаров на складе. 
Если количество товаров хранится как текст, вы не сможете сделать расчет.
*/

SELECT 
    product_name,
    CAST(unit_in_stock AS DECIMAL) * list_price AS total_products
FROM
    products;
    
