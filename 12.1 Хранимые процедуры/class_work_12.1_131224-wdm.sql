CREATE TABLE employees ( id INT PRIMARY KEY AUTO_INCREMENT, name VARCHAR(100), age INT, salary INT, department_id INT );
DROP PROCEDURE IF EXISTS add_employee;

DELIMITER $$

CREATE PROCEDURE add_employee(
    IN emp_name VARCHAR(100),
    IN emp_age INT,
    IN emp_salary INT,
    IN emp_department_id INT
)
BEGIN
    INSERT INTO employees (name, age, salary, department_id)
    VALUES (emp_name, emp_age, emp_salary, emp_department_id);
END $$

DELIMITER ;


CALL add_employee('Alice Johnson', 28, 60000, 1);
CALL add_employee('Bob Smith', 35, 75000, 2);
CALL add_employee('Charlie Brown', 40, 82000, 3);
CALL add_employee('Diana Adams', 25, 54000, 1);
CALL add_employee('Edward Norton', 50, 95000, 4);


DELIMITER //

CREATE PROCEDURE higher_than_avg(
    IN employee_in INT,
    OUT is_higher INT
)
BEGIN
    -- переменная для средней зарплаты
    DECLARE avg_salary DECIMAL(10,2);

    -- переменная для зарплаты конкретного сотрудника
    DECLARE employee_salary DECIMAL(10,2);

    -- вычисляем среднюю зарплату по всем
    SELECT AVG(salary) INTO avg_salary FROM employees;

    -- получаем зарплату конкретного сотрудника
    SELECT salary INTO employee_salary FROM employees WHERE id = employee_in;

    -- сравниваем и устанавливаем выходной параметр
    IF employee_salary > avg_salary THEN
        SET is_higher = 1;
    ELSE
        SET is_higher = 0;
    END IF;
END //

DELIMITER ;

-- Вызов:
CALL higher_than_avg(5, @is_higher);
SELECT @is_higher;
