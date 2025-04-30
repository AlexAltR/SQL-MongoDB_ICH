-- Создаем базу данных. Название в формате: номер_группы__фамилия. Пример: 041124_Petrishchev

CREATE DATABASE 041124_Petrishchev;

USE 041124_Petrishchev;

/*
Создать таблицу Employees со следующими столбцами:
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
    salary DECIMAL(10 , 2) CHECK (salary > 0),
    email VARCHAR(100) UNIQUE
);

SELECT * FROM employees;

-- Заполняем таблицу данными
INSERT INTO employees (first_name, last_name, birth_date, hire_date, salary, email)
VALUES
('Ivan', 'Petrov', '1990-06-15', DEFAULT, 55000.00, 'ivan.petrov@example.com'),
('Anna', 'Sidorova', '1985-11-23', DEFAULT, 72000.50, 'anna.sidorova@example.com'),
('Sergey', 'Kuznetsov', '1992-03-10', '2022-01-05', 48000.75, 'sergey.kuznetsov@example.com'),
('Elena', 'Orlova', '1988-08-09', '2023-05-12', 65000.00, 'elena.orlova@example.com'),
('Dmitry', 'Smirnov', '1995-01-20', DEFAULT, 51000.20, 'dmitry.smirnov@example.com');

-- Заполняем таблицу данными, которые не подходят под ограничения
INSERT INTO employees (first_name, last_name, birth_date, hire_date, salary, email)
VALUES
('Ivan', 'Petrov', '1990-06-15', DEFAULT, '500text', 'iv50.petrov@example.com');


-- Создайте таблицу с первыми двумя строками таблицы Employees.
CREATE TABLE employees2 AS
SELECT * FROM employees
WHERE first_name != '' AND salary != 500.00
LIMIT 2;


-- Удалить таблицу
DROP TABLE employees2;


-- Изменить зарплату сотрудника с EmployeeID = 1 на 65000
UPDATE employees
SET salary = 65000
WHERE employee_id = 1;

-- Увеличить зарплату всех сотрудников, работающих с 2024 года, на 10%
UPDATE employees
SET salary = salary  * 1.1
WHERE hire_date >= '2024-01-01';

-- Удаляем  записи в таблице
DELETE FROM employees
WHERE first_name = '' OR salary = 500.00;

-- Создайте представление на основе всех записей таблицу Employees в Вашей базе данных.
CREATE VIEW first_task AS
SELECT * FROM employees;

-- Создайте представление выбрав первые два столбца из таблицы  Employees в базе данных.
CREATE VIEW second_task AS
SELECT employee_id, first_name FROM employees;


