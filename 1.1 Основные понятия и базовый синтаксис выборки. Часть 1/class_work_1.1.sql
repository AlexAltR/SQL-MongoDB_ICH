/* Задача 1 */
/* Найти всех сотрудников, c job_id = IT_PROG */
SELECT 
    employee_id, first_name, last_name
FROM
    employees
WHERE
    job_id = 'IT_PROG';
    
    
/* Задача 2 */
/* Найти сотрудников, с зп больше 10 000 */
SELECT first_name, last_name, salary
FROM 
     employees
WHERE
    salary > 10000;
    
/* Задача 3 */
/* Найти сотрудников, с зп от 10 000 до 20 000 (включая концы) */

SELECT *
FROM employees
WHERE salary BETWEEN 10000 AND 20000;

/* Задача 4 */
/* Найти сотрудников не из 60, 30 и 100 департамента */
SELECT 
    *
FROM
    hr.employees
WHERE
    department_id NOT IN (30, 60, 100);
    
    
/* Задача 5 */
/* Найти сотрудников у которых есть две буквы ll подряд в середине имени */
SELECT 
    first_name, last_name
FROM
    employees
WHERE
    first_name LIKE '_%ll%_';

/* Задача 6 */
/* Найти сотрудников, у которых фамилия кончается на a) */

SELECT 
    first_name, last_name
FROM
    employees
WHERE
    last_name LIKE '%a';