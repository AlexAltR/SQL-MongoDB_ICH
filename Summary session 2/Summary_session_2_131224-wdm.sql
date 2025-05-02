-- Динамическое преобразование
SELECT 'abc' + 5 AS sum_str_and_num;
SELECT 'a1bc' * 5 AS mul_str_and_num;

-- Явное преобразование
SELECT CAST('123abc' AS UNSIGNED) AS str_to_num;

SELECT 10 / 2, 5 / 3;
SELECT 10 DIV 2, 5 DIV 3;

SELECT FLOOR(10 / 2), FLOOR(5 / 3); -- округляет всегда в меньшую сторону
SELECT ROUND(10 / 2), ROUND(5 / 3); -- округляет по правилам математики
SELECT CEIL(10 / 2), CEIL(5 / 3); -- округляет всегда в большую сторону

SELECT TRUNCATE(10 / 2, 0), TRUNCATE(5 / 3, 2); -- обрезает



