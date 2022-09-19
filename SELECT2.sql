SELECT genre_id, COUNT(*) FROM genre_performers gp 
GROUP BY genre_id;

SELECT COUNT(t.name) FROM tracks t 
JOIN album a ON t.album_id = a.album_id
WHERE a.year >= 2019 AND a.year >= 2020;

SELECT a.name, AVG(duration) FROM album a
JOIN tracks t  ON a.album_id = t.album_id 
GROUP BY a.name;

SELECT name FROM performers
WHERE name NOT IN  (SELECT p.name FROM performers p 
	JOIN album_performers ap  ON p.performers_id = ap.performers_id
	JOIN album a ON ap.album_id = a.album_id
	WHERE year = '2020')
	
SELECT c.name FROM Сollection c 
JOIN collection_tracks ct ON ct.collection_id = c.collection_id 
JOIN tracks t ON ct.tracks_id = t.tracks_id 
JOIN album a ON t.album_id = a.album_id 
JOIN album_performers ap ON a.album_id = ap.album_id 
JOIN performers p ON ap.performers_id = p.performers_id 
WHERE p.name = 'B.B. King' ;

SELECT a.name FROM album a 
JOIN album_performers ap ON a.album_id = ap.album_id 
JOIN performers p ON ap.performers_id = p.performers_id 
JOIN genre_performers gp ON p.performers_id = gp.performers_id 
GROUP BY a.name
HAVING COUNT (genre_id) > 1;

SELECT name FROM tracks t 
LEFT JOIN collection_tracks ct  ON  t.tracks_id  = ct.tracks_id  
WHERE collection_id is NULL;

SELECT p.name, t.duration FROM tracks t 
JOIN album a ON a.album_id = t.album_id 
JOIN album_performers ap ON ap.album_id = a.album_id 
JOIN performers p ON p.performers_id = ap.performers_id 
GROUP BY p.name, t.duration 
HAVING t.duration = (SELECT min(duration) FROM tracks)
ORDER BY p.name 

SELECT a.name FROM album a 
JOIN tracks t ON a.album_id = t.album_id 
GROUP BY a.name
HAVING count(a.name) = (SELECT count(a.name) FROM album a
	JOIN tracks t ON a.album_id = t.album_id 
	GROUP BY a.name
	ORDER BY count
	LIMIT 1);
