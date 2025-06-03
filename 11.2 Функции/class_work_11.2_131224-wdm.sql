/* Создайте функцию для перевода текста в верхний регистр. Функция принимает строку и возвращает её в верхнем регистре. */

DELIMITER //

CREATE FUNCTION to_uppercase(input_string VARCHAR(255))
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
	RETURN upper(input_string);
END;
//
DELIMITER ;

SELECT to_uppercase("some text");


/* Функция для проверки, является ли число четным. Функция принимает целое число и возвращает 1, если оно четное, и 0, если нечетное. */

DELIMITER //

CREATE FUNCTION is_even(input_num INTEGER)
RETURNS TINYINT
DETERMINISTIC
BEGIN
	RETURN IF(input_num % 2 = 0, 1, 0);
END;
//
DELIMITER ;

SELECT is_even(5);
SELECT is_even(8);
