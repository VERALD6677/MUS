-- Создание таблицы жанров музыки
CREATE TABLE IF NOT EXISTS Musical_genres (
    id SERIAL PRIMARY KEY,
    NameMusgen VARCHAR(80) NOT NULL
);

-- Создание таблицы исполнителей
CREATE TABLE IF NOT EXISTS Executors (
    id SERIAL PRIMARY KEY,
    NameExecut VARCHAR(80) NOT NULL
);

-- Создание таблицы связи между жанрами и исполнителями
CREATE TABLE IF NOT EXISTS Musgen_Execut (
    musgen_id INTEGER REFERENCES Musical_genres(id),
    execut_id INTEGER REFERENCES Executors(id),
    CONSTRAINT ME PRIMARY KEY (musgen_id, execut_id)
);

-- Создание таблицы альбомов
CREATE TABLE IF NOT EXISTS Albums (
    id SERIAL PRIMARY KEY,
    NameAlbum VARCHAR(80) NOT NULL,
    YearAlbum INTEGER
);

-- Создание таблицы связи между альбомами и исполнителями
CREATE TABLE IF NOT EXISTS Album_Executors (
    album_id INTEGER REFERENCES Albums(id),
    execut_id INTEGER REFERENCES Executors(id),
    CONSTRAINT AE PRIMARY KEY (album_id, execut_id)
);

-- Создание таблицы треков
CREATE TABLE IF NOT EXISTS Tracks (
    id SERIAL PRIMARY KEY,
    album_id INTEGER REFERENCES Albums(id),
    NameTrack VARCHAR(40) NOT NULL,
    Duration INTEGER
);

-- Создание таблицы сборников
CREATE TABLE IF NOT EXISTS Collections (
    id SERIAL PRIMARY KEY,
    NameCollect VARCHAR(40) NOT NULL,
    YearCollect INTEGER
);

-- Создание таблицы связи между треками и сборниками
CREATE TABLE IF NOT EXISTS Track_Collections (
    track_id INTEGER REFERENCES Tracks(id),
    collect_id INTEGER REFERENCES Collections(id),
    CONSTRAINT TC PRIMARY KEY (track_id, collect_id)
);
