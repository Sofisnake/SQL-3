-- Название и продолжительность самого длительного трека.
SELECT name_song, time_song FROM song
ORDER BY time_song DESC
LIMIT 1;

-- Название треков, продолжительность которых не менее 3,5 минут.
SELECT name_song FROM song
WHERE time_song >= '00:03:30';


-- Названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT name_songsbook FROM songsbook
WHERE date_create <= '31.12.2020' AND date_create >= '01.01.2018' ;

SELECT name_songsbook FROM songsbook
WHERE date_create BETWEEN '01.01.2018' AND '31.12.2020' ;

-- Исполнители, чьё имя состоит из одного слова.
SELECT name FROM executor
WHERE NOT name LIKE '%% %%';

-- Название треков, которые содержат слово «мой» или «my».
SELECT name_song FROM song
WHERE name_song ILIKE 'Мой %' 
OR name_song ILIKE '% мой'
OR name_song ILIKE '% мой %'
OR name_song ILIKE 'мой'
OR name_song ILIKE 'my %'
OR name_song ILIKE '% my'
OR name_song ILIKE '% my %'
OR name_song ILIKE 'my';


-- Количество исполнителей в каждом жанре.
SELECT g.name, count(e.name) FROM genre AS g
LEFT JOIN executorgenre AS eg ON g.id = eg.genre_id 
LEFT JOIN executor AS e ON eg.executor_id = e.id 
GROUP BY g.name 
ORDER BY count(e.id) DESC ;

-- Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT s.name_song, a.create_date FROM album a 
LEFT JOIN song s ON s.album_id = a.id 
WHERE a.create_date >= '01.01.2019' AND a.create_date <='31.12.2020';



-- Средняя продолжительность треков по каждому альбому.
SELECT a.name, AVG(s.time_song) FROM album a 
LEFT JOIN song s ON s.album_id = a.id 
GROUP BY a.name
ORDER BY avg(s.time_song);



-- Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT DISTINCT e.name FROM executor e 
WHERE e.name NOT IN (
	SELECT DISTINCT e.name FROM executor e
	LEFT JOIN albumexecutor ae ON e.id = ae.executor_id
	LEFT JOIN album a ON a.id = ae.album_id
	WHERE a.create_date >= '01.01.2020' OR a.create_date <='31.12.2020'
	);



-- Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
SELECT DISTINCT sb.name_songsbook FROM songsbook sb
LEFT JOIN songinsongsbook sisb ON sb.id = sisb.songsbook_id 
LEFT JOIN song s ON s.id = sisb.song_id 
LEFT JOIN album a ON a.id = s.album_id 
LEFT JOIN albumexecutor ae ON ae.album_id = a.id 
LEFT JOIN executor e ON e.id = ae.executor_id 
WHERE e.name LIKE '%%Сплин%%'
ORDER BY sb.name_songsbook ;
	