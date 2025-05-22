SELECT unit_price AS min_unit_price
FROM order_details;

SELECT unit_price
FROM order_details
ORDER BY unit_price
LIMIT 1;

/* 1.Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd. */ 

SELECT model, speed, hd
FROM pc
WHERE price < 500 AND price IS NOT NULL;

/* 2.Найдите производителей принтеров. Вывести: maker. */

SELECT product.maker 
FROM product
INNER JOIN printer ON product.model=printer.model;


/* 3.Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол. */

SELECT model, ram, hd, screen
FROM laptop
WHERE price > 1000;

/* 4.Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол. */

SELECT model, speed, hd
FROM pc
WHERE price < 600 AND cd IN ('12x', '24x');

/* 5. Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов. Вывод: производитель, скорость. */

SELECT model, speed
FROM product JOIN laptop ON product.model = laptop.model
WHERE hd >= 10;

/* 6. Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price. */
SELECT 
    model, price
FROM
    printer
WHERE
    price = (SELECT 
            MAX(price)
        FROM
            printer);
            
/* 7. Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD. */

SELECT 
    hd
FROM
    pc
GROUP BY hd
HAVING COUNT(code) >= 2;

/* 8. Найдите пары моделей PC, имеющих одинаковые скорость и RAM. В результате каждая пара указывается только один раз, т.е. (i,j), но не (j,i), Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM. */

SELECT 
    pc.model, pc2.model, pc.speed, pc.ram
FROM
    pc
        JOIN
    pc AS pc2 ON (pc.model > pc2.model
        AND pc.speed = pc2.speed
        AND pc.ram = pc2.ram);