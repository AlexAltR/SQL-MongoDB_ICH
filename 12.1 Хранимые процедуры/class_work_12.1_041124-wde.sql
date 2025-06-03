USE `131224_Petrishchev`;

DROP TABLE employees;

CREATE TABLE employees (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    salary DECIMAL(10, 2),
    department_id INT
);

DROP PROCEDURE IF EXISTS add_employee;

-- Создание хранимой процедуры для добавления новых сотрудников
DELIMITER $$

CREATE PROCEDURE add_employee(
	IN emp_name varchar(100),
    IN emp_age INT,
    IN emp_salary DECIMAL(10, 2),
    IN emp_department_id INT
)
BEGIN
	INSERT INTO employees (name, age, salary, department_id)
    VALUES (emp_name, emp_age, emp_salary, emp_department_id);
END $$

DELIMITER ;


CALL add_employee('Alice', 28, 60000, 1);
CALL add_employee('Bob', 20, 48000, 1);
CALL add_employee('John', 30, 70000, 2);
CALL add_employee('Diana', 21, 50000, 2);
CALL add_employee('Margo', 35, 78000, 1);



/* Создайте хранимую процедуру, которая принимает в качестве входного  параметра IN employee_id и возвращает в качестве выходного параметра 1  или 0. Если зарплата сотрудника выше средней зарплаты по всем  департаментам – 1, в противном случае – 0. */

DROP PROCEDURE IF EXISTS higher_than_avg;

DELIMITER $$

CREATE PROCEDURE higher_than_avg(
	IN employee_id INT,
    OUT is_higher INT
) 
BEGIN
	-- переменная для средней зарплаты
    DECLARE avg_salary DECIMAL(10, 2);
    
    -- переменная для зарплаты конкретного сотрудника
    DECLARE employee_salary DECIMAL(10, 2);
    
    -- вычисляем среднюю зарплату по всем департаментам
    SELECT AVG(salary) INTO avg_salary FROM employees;
    
    -- получить зарплату конкретного сотрудника
    SELECT salary INTO employee_salary FROM employees WHERE id = employee_id;
    
    -- сравнием и устанавливаем выходной параметр
    IF employee_salary > avg_salary THEN
		SET is_higher = 1;
	ELSE
		SET is_higher = 0;
	END IF;
END $$

DELIMITER ;

-- вызываем PROCEDURE higher_than_avg
CALL higher_than_avg(1, @is_higher);
SELECT @is_higher;
    
SELECT @is_higher + 5;
SELECT @is_higher;

SET @is_higher = 100;

SELECT @is_higher;


