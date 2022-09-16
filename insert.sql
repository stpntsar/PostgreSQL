INSERT INTO genre (name)
VALUES ('Блюз'), ('Шансон'), ('Регги'), ('Рок'), ('Поп'), ('Рэе и хип-хоп'), ('Электроника'), ('Классика');

INSERT INTO performers (name)
VALUES ('Tom Waits'), ('Eric Clapton'), ('Jimi Hendrix'), ('B.B. King'), ('The Rolling Stones'), ('Janis Joplin'), ('John Lee Hooker'), ('Muddy Waters');

INSERT INTO performers (name)
VALUES ('Burzum'), ('СтеклоVата'), ('Бутырка'), ('Тимур Муцураев'), ('Михаил Круг'), ('Стекловата'), ('Лесоповал'), ('Катя Огонек'), ('Федор Яичный'), ('Стас Михайлов');

INSERT INTO performers (name)
VALUES  ('Bob Marley'), ('Matisyahu'), ('Manu Chao'), ('Gentleman'), ('Sublime'), ('Peter Tosh'), ('Damian Marley'), ('5nizza'), ('Seeed');

INSERT INTO performers (name)
VALUES ('Red Hot Chili Peppers'), ('The Beatles'), ('Muse'), ('Coldplay'), ('Nirvana'), ('Radiohead'), ('Foo Fighters'), ('U2');

INSERT INTO album (name, year)
VALUES ('Rain Dogs', '1985'), ('Closing Time', '1973'), ('Alice', '2002'), ('Bad as Me', '2011'), ('Стoлыпинский вагон', '2021'), ('Седьмая струна', '2019'), ('Погляди мне в глаза', '2010');

INSERT INTO tracks (name, duration, album_id)
VALUES ('No Woman, No Cry', '240', '2'), ('One Love, People Get Ready', '120', '3'), ('I Shot the Sheriff', '160', '5'), ('Redemption Song', '210', '1'),  ('Ghost Town','180', '6'), ('Die young stay pretty','155', '4'), ('Bad Habit','175', '1'), ('Afraid To Feel','167', '3'), ('La Bachata','170', '7'), ('Tití Me Preguntó','150', '6'), ('Sweet Child O Mine','180', '5'), ('Stay With Me','160', '1'), ('BREAK MY SOUL','230', '3'), ('Worlds Smallest Violin','270', '2'), ('Pink Venom','210', '5');

INSERT INTO Сollection (name, year)
VALUES('1th collection', '2016'), ('2th collection', '2017'), ('3th collection', '2018'), ('4th collection', '2019'), ('5th collection', '2020'), ('6th collection', '2021'), ('7th collection', '2022'), ('7th collection', '2022');

INSERT INTO album_performers (performers_id, album_id)
VALUES ('1','6'), ('2','5'), ('3','2'), ('4','1'), ('5','6'), ('6','7'), ('7','5'), ('8','2'), ('9','1'), ('10','4'), ('11','4'), ('12','3'), ('13','2'), ('14','6'), ('15','5'), ('16','7'), ('17','1'), ('18','3'), ('19','2'), ('20','4'), ('21','6'), ('22','5'), ('23','7');

INSERT INTO collection_tracks (collection_id, tracks_id)
VALUES ('1','1'), ('1','2'), ('3','3'), ('2','4'), ('4','5'), ('6','6'), ('5','7'), ('7','8'), ('8','9'), ('8','10'), ('2','11'), ('3','12'), ('5','13'), ('4','14'), ('1','15'); 

INSERT INTO genre_performers (genre_id, performers_id )
VALUES ('5', '4'), ('2', '6'), ('16', '35'), ('15', '33'), ('1', '2'), ('3', '5'), ('4', '20'), ('8', '11'), ('9', '16'), ('10', '18'), ('11', '10'), ('12', '29'), ('13', '28'), ('14', '26'), ('15', '19');