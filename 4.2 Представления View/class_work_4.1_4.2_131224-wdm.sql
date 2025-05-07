DROP DATABASE 131224_Petrishchev;

CREATE DATABASE 131224_Petrishchev;

USE 131224_Petrishchev;

/* Змеинный регистр first_name */
/* Верблюжий регистр firstName */
/* Pascal регистр FirstName */


/*Создать таблицу Employees со следующими столбцами:
EmployeeID
FirstName 
LastName
BirthDate 
HireDate
Salary
Email
*/

/*
Указать ограничения
EmployeeID - первичный ключ, увеличивается автоматически на 1 при добавлении записи
FirstName и LastName - строка длиной в 50 символов Не может быть пустой
BirthDate - дата
HireDate - дата по умолчанию указывается текущая дата
Salary - число с количеством цифр 2 после запятой Общее число знаков, включая запятую, 10 Должна быть больше 0
Email - строка длиной в 100 символов Должна быть уникальной
*/

CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birth_date DATE,
    hire_date DATETIME DEFAULT NOW(),
    salary DECIMAL(10 , 2 ) CHECK (salary >= 0),
    email VARCHAR(100) UNIQUE NOT NULL
);


-- Заполняем таблицу 5 записями

INSERT INTO employees(first_name, last_name, birth_date, hire_date, salary, email)
VALUES
-- Указана hire_date
('Ivan', 'Petrov', '1990-05-10', '2022-04-01', 55000.00, 'ivan.petrov@example.com'),
-- Не указана hire_date → подставится NOW()
('Anna', 'Sidorova', '1987-03-15', DEFAULT, 62000.50, 'anna.sidorova@example.com'),
('Sergey', 'Kuznetsov', '1992-12-01', '2023-06-10', 48000.00, 'sergey.kuznetsov@example.com'),
('Elena', 'Orlova', '1985-07-22', DEFAULT, 70000.75, 'elena.orlova@example.com'),
('Dmitry', 'Smirnov', '1995-09-05', '2021-11-18', 51000.00, 'dmitry.smirnov@example.com');

SELECT * FROM employees;

-- Некорректные данные для вставкиalter
INSERT INTO employees(first_name, last_name, birth_date, hire_date, salary, email)
VALUES
('Ivan', 'Petrov', '1990-05-10', '2022-04-01', -1.00, 'ivan97.petrov@example.com');


/*Создайте таблицу с первыми двумя строками таблицы Employees.*/
CREATE TABLE new_employees AS
SELECT * FROM employees LIMIT 2;

SELECT * FROM new_employees;

-- Изменить зарплату сотрудника с EmployeeID = 1 на 65000
UPDATE employees 
SET 
    salary = 65000
WHERE
    employee_id = 1;
    
/*
Увеличить зарплату всех сотрудников, работающих с 2024 года, на 10%
*/

SELECT 
    employee_id, first_name, last_name, hire_date, salary
FROM
    employees;
    
UPDATE employees 
SET 
    salary = salary * 1.10
WHERE
    hire_date < '2024-01-01';
    

    
    
/* Создайте представление на основе всех записей таблицу Employees в Вашей базе данных.*/

CREATE VIEW all_employees AS
    SELECT 
        *
    FROM
        employees;

/* Создайте представление выбрав первые два столбца из таблицы  Employees в базе данных. */
CREATE VIEW first_two_columns_employees AS
    SELECT 
        employee_id, first_name
    FROM
        employees;
        
SELECT * FROM all_employees;


