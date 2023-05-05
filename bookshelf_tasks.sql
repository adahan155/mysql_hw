-- 1. Найти автора с самым большим числом книг и вывести его имя
use db_42b5a4;
SELECT authors.name FROM authors JOIN authors_books 
ON authors_books.authors_id = authors.id
group by authors.name
order by count(authors_books.authors_id) DESC
limit 1;

-- 2. Вывести пять самых старых книг у которых указан год издания
SELECT distinct books.title, books.year FROM books
where books.year IS NOT NULL
order by books.year ASC 
limit 5;

-- 3. Вывести общее количество книг на полке в кабинете
SELECT COUNT(books.title) as amount
FROM books JOIN shelves ON books.shelves_id = shelves.id
where shelves.title LIKE "Полка в кабинете"
group by books.shelves_id;

-- 4. Вывести названия, имена авторов и годы издания книг, которые находятся на полке в спальне
SELECT books.title, authors.name, books.year FROM books
JOIN shelves ON books.shelves_id = shelves.id
JOIN authors_books ON authors_books.books_id = books.id
JOIN authors ON authors_books.authors_id = authors.id
where shelves.title LIKE "Полка в спальне"
ORDER by books.title;

-- 5. Вывести названия и годы издания книг, написанных автором 'Лев Толстой'
SELECT distinct books.title, books.year FROM authors_books
JOIN authors ON authors_books.authors_id = authors.id
JOIN books ON authors_books.books_id = books.id
where authors.name LIKE "Лев Толстой";

-- 6. Вывести название книг, которые написали авторы, чьи имена начинаются на букву "А"
SELECT books.title, authors.name FROM authors_books
JOIN authors ON authors_books.authors_id = authors.id
JOIN books ON authors_books.books_id = books.id
Where authors.name LIKE "А%";

-- 7. Вывести название книг и имена авторов для книг, которые находятся на полках, названия которых включают слова «верхняя» или «нижняя»
SELECT books.title, authors.name, shelves.title FROM books
JOIN shelves ON books.shelves_id = shelves.id
JOIN authors_books ON authors_books.books_id = books.id
JOIN authors ON authors_books.authors_id = authors.id
where shelves.title LIKE "%Верхняя%" or "%Нижняя%"
ORDER by authors.name;

-- 8. Книгу «Божественная комедия» автора «Данте Алигьери» одолжили почитать другу Ивану Иванову, необходимо написать один или несколько запросов которые отразят это событие в БД
UPDATE books
SET books.friends_id = 1
WHERE id = 9;

-- 9. Добавить в базу книгу «Краткие ответы на большие вопросы», год издания 2020, автор «Стивен Хокинг», положить ее на полку в кабинете
INSERT INTO books (title, year, shelves_id) 
values ("Краткие ответы на большие вопросы", "2020", "1");

INSERT INTO authors (name)
values ("Стивен Хокинг");

INSERT INTO authors_books (books_id, authors_id)
values ("358","289");
