/* Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd. */

SELECT 
    model, speed, hd
FROM
    pc
WHERE
    price < 500 AND price IS NOT NULL;
    
    
/* Найдите производителей принтеров. Вывести: maker. */

SELECT DISTINCT maker
FROM product
WHERE type = 'printer';


/* Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол. */

SELECT 
    model, hd, ram, screen
FROM
    laptop
WHERE
    price > 1000 AND price IS NOT NULL ;
    
    
/* Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол. */

SELECT model, speed, hd
FROM pc
WHERE (price < 600 AND price IS NOT NULL) AND cd IN ('12x', '24x');