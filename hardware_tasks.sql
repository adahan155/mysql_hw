-- 1. Вывести суммарное количество единиц техники на складе 
SELECT SUM(amount) FROM hardware;

-- 2. Вывести какие товары на складе закончились
SELECT * FROM hardware WHERE amount = 0;

-- 3. Вывести среднюю цену монитора
SELECT AVG(price) FROM hardware WHERE title LIKE ('Монитор%');

-- 4. Вывести все клавиатуры, при этом результаты отсортировать от самой дешевой до самой дорогой
SELECT * FROM hardware WHERE title LIKE ('Клавиатура%') order by price ASC;

-- 5. Вывести в рамках одного запроса количество товарных позиций по каждому тегу с использованием группировки, результаты отсортировать от максимального количества до минимального
SELECT tag, COUNT(*) as amount FROM hardware
GROUP BY tag ORDER BY amount DESC;

-- 6. Вывести количество товарных позиций со скидками на складе
SELECT COUNT(*) FROM hardware
 WHERE tag = 'discount';
 
-- 7.Вывести название и цену самой дорогой новинки
SELECT title,price FROM hardware WHERE tag = 'new'
ORDER BY price DESC
LIMIT 1;

-- 8. Добавить в таблицу товар Ноутбук Lenovo 2BXKQ7E9XD как новинку по цене 54500 руб. в единственном экземпляре
INSERT INTO `hardware` (`title`, `price`, `amount`, `tag`) 
VALUES 
('Ноутбук Lenovo 2BXKQ7E9XD', '54500', '1', 'new');

-- 9. Найти и удалить по названию из базы ошибочно добавленный товар Очки PS VR 2
DELETE FROM hardware WHERE title = 'Очки PS VR 2' 
limit 1;


 
