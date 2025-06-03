/* Создайте таблицу products с колонками id (INT) и product_name (VARCHAR), price.
Вставьте несколько записей в таблицу.
Создайте хранимую процедуру с IN-параметром для поиска имени товара по его идентификатору.
Вызовите эту процедуру и проверьте результат. */


CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10 , 2 ) NOT NULL
);
INSERT INTO products(product_name, price)
VALUES
	('bread', 5.4), 
    ('flatbread', 7.8),
    ('sausage', 25.7), 
    ('butter', 15.8), 
    ('potato', 10.4);
    
DELIMITER $$

CREATE PROCEDURE search_product_name (IN product_id INT)
BEGIN
	SELECT product_name FROM products WHERE id = product_id;

END $$

DELIMITER ;

CALL search_product_name(3);



/* Создайте таблицу employees с колонками id (INT), name (VARCHAR), monthly_salary (INT).
Вставьте несколько записей в таблицу.
Создайте хранимую процедуру, которая возвращает годовую зарплату (ежемесячная зарплата * 12) через OUT-параметр.
Вызовите процедуру и проверьте результат, используя переменную для OUT-параметра. */ 


CREATE TABLE employees_task2 (
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100),
monthly_salary DECIMAL(10, 2)
);
INSERT INTO employees_task2 (name, monthly_salary)
VALUES
('Alice', 5000),
('Bob', 3000),
('John', 7000),
('Diana', 4000),
('Margo', 8000);

DELIMITER $$
CREATE PROCEDURE year_salary(
IN employee_id INT,
OUT year_salary INT
)
BEGIN
SELECT monthly_salary * 12 INTO year_salary
FROM employees_task2
WHERE employee_id = id;
END
$$ DELIMITER ;

CALL year_salary(1, @year_salary);
SELECT @year_salary;