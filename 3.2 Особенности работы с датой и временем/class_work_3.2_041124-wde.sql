SELECT 
    NOW() AS CurrentDateTime,
    CURDATE() AS CurrentDate,
    CURTIME() AS CurrentTime,
    DATE_FORMAT(NOW(), '%d-%m-%Y %H:%i:%s') AS FormattedDateTime,
    DATEDIFF('2025-08-30', '2024-08-25') AS DaysDifference,
    DATE_ADD(NOW(), INTERVAL 10 DAY) AS FutureDate,
    DATE_SUB(NOW(), INTERVAL 10 DAY) AS PastDate,
    EXTRACT(YEAR FROM NOW()) AS CurrentYear,
    EXTRACT(DAY FROM NOW()) AS CurrentDay,
    TIME_TO_SEC('02:30:01') AS Seconds,
    SEC_TO_TIME(9001) AS TimeFormat;
    



SELECT 'Hello';



/*
Выведите дату получения заказа OrderDate из таблицы Orders 
В формате ДД-ММ-ГГГГ.
*/

SELECT 
    *
FROM
    northwind.orders;

SELECT 
    id,
    order_date,
    DATE_FORMAT(order_date, '%d-%m-%Y') AS FormattedDateTime
FROM
    orders;
    
/*
Выведите дату и время отправки заказа ShippedDate из таблицы Orders 
В формате ДД/ММ/ГГГГ ЧЧ:ММ:СС.
*/

SELECT 
    id,
   shipped_date,
    DATE_FORMAT(shipped_date, '%d-%m-%Y %H:%i:%s') AS FormatDate
FROM
    orders;
    
    
/*
Найдите разницу в днях между датой заказа OrderDate и датой отправки ShippedDate для всех заказов в таблице Orders.
*/

SELECT 
    id,
    shipped_date,
    order_date,
    DATEDIFF(shipped_date, order_date) AS DaysDifference
FROM
    northwind.orders;
    
/*
Найдите дату, которая была 90 дней до текущей даты.
*/

SELECT 
    DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 90 DAY),
            '%d-%m-%Y') AS PastDate;
            
            
/* Использование скрытых преобразований.
Сложите строку, содержащую дату, с числом и выведите результат.
Объедините числовое значение с текстом и выведите результат в виде строки. */
SELECT CONCAT('2025-08-30' + 5 + '5', ' ', 'лет') AS result;

/*
Извлеките год из даты получения заказа OrderDate.
*/
SELECT 
    id, order_date, EXTRACT(YEAR FROM order_date) AS order_year
FROM
    northwind.orders;
    
/*
Преобразуйте текстовое значение, представляющее дату, в формат DATE.
*/

SELECT CAST('2025-04-23' AS DATE) AS ResultDate;


