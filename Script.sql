CREATE TABLE IF NOT EXISTS Genre (
	genre_id SERIAL PRIMARY KEY,
	name VARCHAR (60) NOT NULL
);
CREATE TABLE IF NOT EXISTS Performers (
	performers_id SERIAL PRIMARY KEY,
	name VARCHAR (60) NOT NULL	
);
CREATE TABLE IF NOT EXISTS Album (
	album_id SERIAL PRIMARY KEY,
	name VARCHAR (60) NOT NULL,
	year INTEGER
);
CREATE TABLE IF NOT EXISTS Genre_performers (
	genre_id INTEGER REFERENCES Genre (genre_id),
	performers_id INTEGER REFERENCES Performers (performers_id)
);
CREATE TABLE IF NOT EXISTS Album_performers (
	performers_id INTEGER REFERENCES Performers (performers_id),
	album_id INTEGER REFERENCES Album (album_id)
);
CREATE TABLE IF NOT EXISTS Tracks (
	tracks_id SERIAL PRIMARY KEY,
	name VARCHAR (60) NOT NULL,
	duration INTEGER,
	album_id INTEGER REFERENCES Album (album_id)
);
CREATE TABLE IF NOT EXISTS Сollection (
	collection_id SERIAL PRIMARY KEY,
	name VARCHAR (60) NOT NULL,
	year INTEGER
);
CREATE TABLE IF NOT EXISTS Collection_tracks (
	collection_id INTEGER REFERENCES Сollection (collection_id),
	tracks_id INTEGER REFERENCES Tracks (tracks_id)
);