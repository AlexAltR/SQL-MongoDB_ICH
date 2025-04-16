/* Задача 1 */
/* Найти всех сотрудников, работающих в департаменте с id 90 */

SELECT 
    *
FROM
    hr.employees
WHERE
    department_id = 90;
    
/* Задача 2 */
/* Найти всех сотрудников, зарабатывающих больше 5000 */
SELECT 
    first_name, last_name, salary
FROM
    employees
WHERE
       salary > 5000;
       
       
/* Задача 3 */
/* Найти всех сотрудников, чья фамилия начинается на букву L */
SELECT 
    first_name, last_name
FROM
    employees
WHERE
    last_name LIKE 'L%';
    
/* Задача 4 */
/* Найти все департаменты, у которых location_id 1700 */

SELECT 
    *
FROM
    hr.departments
WHERE
    location_id = 1700;
    
/* Задача 5 */
/* Найти все города с country_id US */

SELECT 
    *
FROM
    hr.locations
WHERE
    country_id = 'US';
    
/* Задача 6 */
/* Вывести зарплату сотрудника с именем ‘Lex’ и фамилией ‘De Haan' */
SELECT 
    salary
FROM
    employees
WHERE
    first_name = 'Lex'
        AND last_name = 'De Haan';
        
/* Задача 7 */
/* Вывести всех сотрудников с job_id ‘FI_ACCOUNT’ и зарабатывающих меньше 8000 */

SELECT 
    *
FROM
    hr.employees
WHERE
    job_id = 'FI_ACCOUNT' AND salary < 8000;
    
/* Задача 8 */
/* Вывести сотрудников, у которых в фамилии в середине слова встречаются сочетания ‘kk’ или ‘ll’ */

SELECT 
    *
FROM
    employees
WHERE
    last_name LIKE '_%kk%_'
        OR last_name LIKE '_%ll%_';


/* Задача 9 */
/* Вывести сотрудников с commission_pct NULL */
