SELECT 
    NOW() AS CurrentDateTime,
    CURDATE() AS CurrentDate,
    CURTIME() AS CurrentTime,
    DATE_FORMAT(NOW(), '%d-%m-%Y %H:%i:%s') AS FormattedDateTime,
    DATEDIFF(CURDATE(), '2024-08-30') AS DaysDifference,
    DATE_ADD(NOW(), INTERVAL 30 DAY) AS FutureDate,
    DATE_SUB(NOW(), INTERVAL 10 DAY) AS PastDate,
    EXTRACT(YEAR FROM NOW()) AS CurrentYear,
    TIME_TO_SEC('02:30:01') AS Seconds,
    SEC_TO_TIME(9001) AS TimeFormat;
    
    
/* Выведите дату получения заказа OrderDate из таблицы Orders 
В формате ДД-ММ-ГГГГ. */

SELECT 
    order_date,
    DATE_FORMAT(order_date, '%d-%m-%Y') AS FormattedDateTime
FROM
    orders;
    

/*
Выведите дату и время отправки заказа ShippedDate из таблицы Orders 
В формате ДД/ММ/ГГГГ ЧЧ:ММ:СС.
*/
SELECT 
    shipped_date,
    DATE_FORMAT(shipped_date, '%d-%m-%Y %H:%i:%s') AS FormattedDateTime
FROM
    orders;
    
    
/*
Найдите разницу в днях между датой заказа OrderDate и датой отправки ShippedDate для всех заказов в таблице Orders.
*/


SELECT 
    id,
    DATE_FORMAT(shipped_date, '%d-%m-%Y') AS shipped_date,
    DATE_FORMAT(order_date, '%d-%m-%Y') AS order_date,
    DATEDIFF(shipped_date, order_date) AS date_diff
FROM
    orders;
    
/*
Найдите дату, которая была 90 дней до текущей даты.
*/
SELECT CURDATE() - INTERVAL 90 DAY AS DaysAgo;

/*
Использование скрытых преобразований.
Сложите строку, содержащую дату, с числом и выведите результат.
Объедините числовое значение с текстом и выведите результат в виде строки.
*/

SELECT 
    '2025-04-29' + 8 AS Result,
    CONCAT('Data Base', ' ', 5) AS DataText,
    ('Data Base' + 5) AS Total;


/*
Извлеките год из даты получения заказа OrderDate.
*/
SELECT 
    id, order_date, YEAR(order_date) AS OrderYear
FROM
    orders;
