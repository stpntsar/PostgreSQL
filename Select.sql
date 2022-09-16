SELECT name, year FROM album
WHERE year = 2018;

SELECT name, duration FROM tracks
ORDER BY duration DESC
LIMIT 1;

SELECT name FROM tracks
WHERE duration >=210;

SELECT name FROM Сollection
WHERE year BETWEEN 2018 AND 2020;

SELECT name FROM performers
WHERE name NOT LIKE '% %';

SELECT name FROM tracks
WHERE name LIKE '%my%';