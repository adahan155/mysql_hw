-- 1. Вывести сколько фильмов сняла кинокомпания Universal Pictures
SELECT COUNT(movies.title) as 'Universal Pictures'
FROM movies
JOIN companies ON movies.companies_id = companies.id
WHERE companies.title = 'Universal Pictures';

-- 2 Вывести сколько всего фильмов было снято режиссером Фрэнсисом Фордом Копполой
SELECT COUNT(movies.title) as 'movies amount' 
FROM movies
JOIN directors ON movies.directors_id = directors.id
WHERE directors.full_name = 'Фрэнсис Форд Коппола';

-- 3. Вывести количество снятых фильмов за последние 20 лет
SELECT COUNT(movies.title) as 'For last 20 years'
FROM movies
WHERE movies.year between (year(CURDATE()) - 20) AND year(curdate());

-- 4. Вывести все жанры фильмов в которых снимал Стивен Спилберг в течении всей своей карьеры
SELECT DISTINCT genres.title 
FROM movies
JOIN genres ON movies.genres_id = genres.id
JOIN directors ON movies.directors_id = directors.id
WHERE directors.full_name = 'Стивен Спилберг';

-- 5. Вывести названия, жанры и режиссеров 5 самых дорогих фильмов
SELECT movies.title, genres.title, directors.full_name 
FROM movies
JOIN genres ON movies.genres_id = genres.id
JOIN directors ON movies.directors_id = directors.id
ORDER BY movies.budget DESC
limit 5;

-- 6. Вывести имя режиссера с самым большим количеством фильмов
SELECT directors.full_name FROM movies
JOIN directors ON movies.directors_id = directors.id
GROUP BY directors.full_name
ORDER BY COUNT(movies.title) DESC
limit 1;

-- 7. Вывести названия и жанры фильмов, снятые самой большой кинокомпанией (по сумме всех бюджетов фильмов)
SELECT movies.title, genres.title
FROM movies 
JOIN genres ON movies.genres_id = genres.id
JOIN companies ON movies.companies_id = companies.id
WHERE companies_id = 
	(SELECT companies.id
FROM companies
JOIN movies ON movies.companies_id = companies.id 
GROUP BY companies.id
ORDER BY SUM(movies.budget) DESC
limit 1
 );
 
 -- 8. Вывести средний бюджет фильмов, снятых кинокомпанией Warner Bros.
 SELECT AVG(movies.budget)
 FROM movies
 JOIN companies ON movies.companies_id = companies.id
 WHERE companies.title = 'Warner Bros.';
 
 -- 9. Вывести количество фильмов каждого жанра и средний бюджет по жанру
 SELECT genres.title, COUNT(movies.title) as 'amount', AVG(movies.budget) as 'budget'
 FROM movies
 JOIN genres ON movies.genres_id = genres.id
 group by genres.title;
 
 -- 10. Найти и удалить комедию "Дикие истории" 2014-го года
 DELETE movies FROM movies
 JOIN genres ON movies.gernes_id = genres.id
 WHERE movies.title = 'Дикие истории' 
 AND genres.title = 'комедия'
 AND movies.year = '2014'
	AND movies.id > 0;

 



