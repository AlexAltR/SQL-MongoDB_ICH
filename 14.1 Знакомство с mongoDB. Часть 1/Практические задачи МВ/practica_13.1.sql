-- 1.	Найти количество сотрудников у каждого менеджера. Вывести manager_id и employees_cnt

SELECT 
    manager_id, 
    COUNT(*) AS employees_cnt
FROM 
    employees
WHERE 
    manager_id IS NOT NULL
GROUP BY 
    manager_id;


-- 2.	Работаем с базой World. Выведите седьмой по густонаселенности город. Подсказка: использовать функцию DENSE_RANK() и оконные функции. 

SELECT 
    `Name`, 
    CountryCode, 
    District, 
    `Population`
FROM 
    (
        SELECT 
            `Name`, 
            CountryCode, 
            District, 
            `Population`,
            DENSE_RANK() OVER (ORDER BY `Population` DESC) AS population_rank
        FROM 
            world.city
    ) AS RankedCities
WHERE 
    population_rank = 7;


-- 3.	Выведите название города, население и максимальное население для каждого города

SELECT 
    Name, 
    Population, 
    MAX(Population) OVER () AS max_population
FROM 
    world.city;


-- 4.	Напишите запрос для определения разницы в продолжительности жизни между текущей страной и страной с самой высокой продолжительностью жизни.

SELECT 
    Name,
    LifeExpectancy,
    MAX(LifeExpectancy) OVER () AS max_life_expectancy,
    (MAX(LifeExpectancy) OVER () - LifeExpectancy) AS life_expectancy_difference
FROM 
    country
WHERE 
    LifeExpectancy IS NOT NULL;


-- 5.	Выполните ранжирование стран по средней численности населения

-- Если хотите использовать DENSE_RANK() (которая присваивает одинаковые ранги странам с одинаковой численностью населения, но без пропусков в нумерации), запрос будет таким:

SELECT 
    Name, 
    Population, 
    DENSE_RANK() OVER (ORDER BY Population DESC) AS population_rank
FROM 
    country
WHERE 
    Population IS NOT NULL;


-- 6.	На основании предыдущего запроса выведите топ 5 стран по средней численности населения (Используйте LIMIT)

SELECT 
    Name, 
    Population, 
    RANK() OVER (ORDER BY Population DESC) AS population_rank
FROM 
    country
WHERE 
    Population IS NOT NULL
LIMIT 5;
