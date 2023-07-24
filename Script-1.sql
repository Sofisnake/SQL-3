CREATE TABLE IF NOT EXISTS Genre (
id serial PRIMARY KEY,
name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS Executor (
id serial PRIMARY KEY,
name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS ExecutorGenre (
genre_id INTEGER REFERENCES Genre(id),
executor_id INTEGER REFERENCES Executor(id),
constraint pk primary key (genre_id, executor_id)
);

CREATE TABLE IF NOT EXISTS Album (
id serial PRIMARY KEY,
name VARCHAR(60) NOT NULL,
create_date date NOT NULL
);

CREATE TABLE IF NOT EXISTS AlbumExecutor (
album_id INTEGER REFERENCES Album(id),
executor_id INTEGER REFERENCES Executor(id),
constraint pk_AlbumExecutor primary key (album_id, executor_id)
);

CREATE TABLE IF NOT EXISTS Song (
id serial PRIMARY KEY,
name_song VARCHAR(60) NOT NULL,
time_song TIME NOT NULL,
album_id INTEGER NOT NULL REFERENCES Album(id)
);

CREATE TABLE IF NOT EXISTS SongsBook (
id serial PRIMARY KEY,
name_songsBook VARCHAR(60) NOT NULL,
date_create date NOT NULL
);

CREATE TABLE IF NOT EXISTS SongInSongsBook (
song_id INTEGER REFERENCES Song(id),
songsbook_id INTEGER REFERENCES SongsBook(id),
constraint pk_SongInSongsBook primary key (song_id, songsbook_id)
);

INSERT INTO executor(name)
VALUES('Zivert');

INSERT INTO executor(name)
VALUES('Руки вверх');

INSERT INTO executor(name)
VALUES('Сплин');

INSERT INTO executor(name)
VALUES('Кино');

INSERT INTO executor(name)
VALUES('Монеточка');

INSERT INTO genre(name)
VALUES('Рок');

INSERT INTO genre(name)
VALUES('Инди');

INSERT INTO genre(name)
VALUES('ПОП');

INSERT INTO album(name, create_date)
VALUES('Расскраски для взрослых', '25.05.2018');

INSERT INTO album
VALUES(9080, 'Расскраски', '25.05.2019');

INSERT INTO album
VALUES(120, 'Сделай погромче!', '25.05.1998');

INSERT INTO album
VALUES(2,'Сияй', '06.04.2018');

INSERT INTO album
VALUES(7, 'Легенда','19.05.2018');

INSERT INTO album
VALUES(4, 'Гранатовый альбом', '01.04.1998');

INSERT INTO song
VALUES(1179, 'ляляля', '00:02:59.0000', 9080);

INSERT INTO song(name_song, time_song, album_id)
VALUES('Нимфоманка', '00:02:40.0000', 1);

INSERT INTO song
VALUES(11, 'Каждый раз', '00:03:28.0000', 1);

INSERT INTO song(name_song, time_song, album_id)
VALUES('Сияй','00:03:24.0000', 2);

INSERT INTO song(name_song, time_song, album_id)
VALUES('Океан','00:03:24.0000', 2);

INSERT INTO song
VALUES(30, 'Кукушка','00:06:40.0000', 7);

INSERT INTO song
VALUES(987, 'Группа крови','00:03:59.0000', 7);

INSERT INTO song(name_song, time_song, album_id)
VALUES('Приходи','00:04:02.0000', 4);

INSERT INTO song
VALUES(100, 'Выхода нет','00:03:47.0000', 4);

INSERT INTO song
VALUES(19, 'Мой родной','00:03:57.0000', 4);

INSERT INTO song
VALUES(1121, 'Крошка моя', '00:04:10.0000', 120);

INSERT INTO song
VALUES(1122, 'Чужие губы', '00:04:02.0000', 120);

INSERT INTO songsbook(name_songsBook, date_create)
VALUES('На закате', '19.05.2020');

INSERT INTO songsbook(name_songsBook, date_create)
VALUES('Рассвет', '01.06.2019');

INSERT INTO songsbook(name_songsBook, date_create)
VALUES('Грусть', '10.09.2020');

INSERT INTO songsbook(name_songsBook, date_create)
VALUES('Воспоминания из детства', '19.05.2021');

INSERT INTO albumexecutor (album_id, executor_id)
VALUES(1, 4);

INSERT INTO albumexecutor (album_id, executor_id)
VALUES(9080, 4);

INSERT INTO albumexecutor (album_id, executor_id)
VALUES(2, 1);

INSERT INTO albumexecutor (album_id, executor_id)
VALUES(7, 3);

INSERT INTO albumexecutor (album_id, executor_id)
VALUES(4, 2);

INSERT INTO albumexecutor (album_id, executor_id)
VALUES(120, 5);

INSERT INTO executorgenre  (executor_id, genre_id )
VALUES(1, 3);

INSERT INTO executorgenre (executor_id, genre_id )
VALUES(2, 1);

INSERT INTO executorgenre (executor_id, genre_id )
VALUES(3, 1);

INSERT INTO executorgenre (executor_id, genre_id )
VALUES(4, 2);

INSERT INTO executorgenre (executor_id, genre_id )
VALUES(5, 3);

INSERT INTO songinsongsbook (song_id, songsbook_id)
VALUES(1179, 3);

INSERT INTO songinsongsbook (song_id, songsbook_id)
VALUES(2, 1);

INSERT INTO songinsongsbook (song_id, songsbook_id)
VALUES(11, 1);

INSERT INTO songinsongsbook (song_id, songsbook_id)
VALUES(3, 3);

INSERT INTO songinsongsbook (song_id, songsbook_id)
VALUES(4, 3);

INSERT INTO songinsongsbook (song_id, songsbook_id)
VALUES(30, 2);

INSERT INTO songinsongsbook (song_id, songsbook_id)
VALUES(987, 2);

INSERT INTO songinsongsbook (song_id, songsbook_id)
VALUES(1, 2);

INSERT INTO songinsongsbook (song_id, songsbook_id)
VALUES(100, 2);

INSERT INTO songinsongsbook (song_id, songsbook_id)
VALUES(19, 4);

INSERT INTO songinsongsbook (song_id, songsbook_id)
VALUES(100, 4);

INSERT INTO songinsongsbook (song_id, songsbook_id)
VALUES(1, 4);

INSERT INTO songinsongsbook (song_id, songsbook_id)
VALUES(30, 4);

INSERT INTO songinsongsbook (song_id, songsbook_id)
VALUES(1121, 2);

INSERT INTO songinsongsbook (song_id, songsbook_id)
VALUES(1122, 2);