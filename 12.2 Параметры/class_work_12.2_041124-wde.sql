DROP TABLE employees;

CREATE TABLE employees (
id INT PRIMARY KEY AUTO_INCREMENT, 
name VARCHAR (100), 
age INT NOT NULL, 
salary DECIMAL(10,2) NOT NULL, 
department_id INT
);


DELIMITER $$

CREATE PROCEDURE add_employee (IN emp_name VARCHAR(100) ,IN emp_age INT, IN emp_salary DECIMAL(10,2),IN emp_department_id INT)
BEGIN
	INSERT INTO employees (name, age, salary, department_id)
		VALUES (emp_name, emp_age, emp_salary, emp_department_id);
END $$
DELIMITER ;

CALL add_employee('Ivan Petrov', 35, 80000, 1);
CALL add_employee('Anna Petrov', 34, 75000, 2);
CALL add_employee('Inna Petrov', 33, 64000, 3);
CALL add_employee('Egor Smirnov', 32, 76000, 3);
CALL add_employee('Aleksandr Ivanov', 31, 65000, 2);


DELIMITER //

CREATE PROCEDURE higher_than_avg(
	IN employee_id INT,
	OUT is_higher INT
)
BEGIN
	-- переменная для средней зарплаты
    DECLARE avg_salary DECIMAL(10, 2);
    
    -- переменная для зарплаты конкретного сотрудника
    DECLARE employee_salary DECIMAL(10, 2);
    
    -- вычисляем среднию зарплату по всем сотрудникам
    SELECT AVG(salary) INTO avg_salary FROM employees;
    
    -- получить зарплату конкретного сотрудника
    SELECT salary INTO employee_salary FROM employees WHERE id = employee_id;
    
    -- сравниваем и устанавливаем выходной параметр
	IF employee_salary > avg_salary THEN
		SET is_higher = 1;
	ELSE
		SET is_higher = 0;
	END IF;
END //

DELIMITER ;

-- Вызов
CALL higher_than_avg(3, @is_higher);
SELECT @is_higher;


/* Создайте таблицу products с колонками id (INT) и product_name (VARCHAR), price.
Вставьте несколько записей в таблицу.
Создайте хранимую процедуру с IN-параметром для поиска имени товара по его идентификатору.
Вызовите эту процедуру и проверьте результат */
CREATE TABLE products(
id INT PRIMARY KEY AUTO_INCREMENT,
product_name VARCHAR (100),
price DECIMAL(10,2) 
);

DELIMITER $$ 
CREATE PROCEDURE add_products (IN emp_product_name VARCHAR (100), IN emp_price DECIMAL(10,2))
BEGIN
INSERT INTO products (product_name, price)
VALUES (emp_product_name, emp_price);
END $$
DELIMITER ;

CALL add_products('Ноутбук', 750.00);
CALL add_products('Смартфон', 500.00);
CALL add_products('Наушники', 100.00);
CALL add_products('Монитор', 300.00);
CALL add_products('Клавиатура', 50.00);

DELIMITER $$ 
CREATE PROCEDURE get_product_name (IN product_id INT)
BEGIN
DECLARE product_name_var VARCHAR (100);
SELECT product_name INTO product_name_var  FROM products WHERE id = product_id;
	IF product_name_var IS NULL THEN 
    SELECT "Dont" AS result;
    ELSE 
    SELECT product_name_var AS result;
	END IF;

END $$
DELIMITER ;

CALL get_product_name(7);


/* Создайте хранимую процедуру, которая принимает значение бонуса для сотрудника, увеличивает его на 15% и возвращает новое значение через INOUT-параметр.
Создайте переменную для хранения значения бонуса.
Создайте хранимую процедуру с INOUT-параметром, которая увеличивает бонус на 15%.
Вызовите процедуру с начальными значениями и проверьте измененные значения. */

DELIMITER $$
CREATE PROCEDURE change_bonus( INOUT bonus_param DECIMAL(10,2))
BEGIN
    SET bonus_param = bonus_param * 1.15;
END $$
DELIMITER ;

SET @bonus = 1000;
CALL change_bonus(@bonus);
SELECT @bonus;
