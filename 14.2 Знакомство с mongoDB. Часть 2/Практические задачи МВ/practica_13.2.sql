-- 8.	На основании предыдущего запроса выведите топ 5 стран по средней численности населения (используйте вложенный запрос)

SELECT 
    Name, 
    Population, 
    population_rank
FROM 
    (
        SELECT 
            Name, 
            Population, 
            RANK() OVER (ORDER BY Population DESC) AS population_rank
        FROM 
            country
        WHERE 
            Population IS NOT NULL
    ) AS ranked_countries
WHERE 
    population_rank <= 5;


-- 9.	Напишите запрос для определения доли населения города от общей численности населения страны и проведите ранжирование городов в пределах каждой страны:

SELECT 
    city.Name AS city_name,
    country.Name AS country_name,
    city.Population AS city_population,
    country.Population AS country_population,
    ROUND((city.Population / country.Population) * 100, 2) AS population_percentage,
    RANK() OVER (PARTITION BY country.Code ORDER BY city.Population DESC) AS city_rank
FROM 
    city
JOIN 
    country ON city.CountryCode = country.Code
WHERE 
    city.Population IS NOT NULL
    AND country.Population IS NOT NULL;


-- 10.	Написать SQL-запрос для выбора городов, занимающих первое место по населению в своих странах и превышающих среднее население по всем городам.

SELECT 
    city.Name AS city_name,
    country.Name AS country_name,
    city.Population AS city_population
FROM 
    city
JOIN 
    country ON city.CountryCode = country.Code
WHERE 
    city.Population > (
        -- Подзапрос для вычисления среднего населения по всем городам
        SELECT AVG(Population) 
        FROM city
    )
AND 
    city.Population = (
        -- Подзапрос для нахождения максимального населения в стране
        SELECT MAX(c.Population) 
        FROM city c
        WHERE c.CountryCode = city.CountryCode
    );

-- 11.	Выведите страны, где количество городов больше 10

SELECT 
    country.Name AS country_name,
    COUNT(city.ID) AS city_count
FROM 
    country
JOIN 
    city ON country.Code = city.CountryCode
GROUP BY 
    country.Name
HAVING 
    city_count > 10;

-- 13.	Выведите список форм правления (GovernmentForm) c количеством стран, где есть эта форма правления. 
SELECT 
    GovernmentForm, 
    COUNT(*) AS country_count
FROM 
    country
GROUP BY 
    GovernmentForm;


-- 14.	Выведите формы правления, которые есть в 10 и более странах.
SELECT 
    GovernmentForm, 
    COUNT(*) AS country_count
FROM 
    country
GROUP BY 
    GovernmentForm
HAVING 
    country_count >= 10;
