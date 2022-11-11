INSERT INTO storage(storage_name) VALUES ('шкаф в туалете'), ('прикроватная тумбочка'), ('кухня'), ('шкаф в кабинете'), ('iPad');

INSERT INTO shelf (shelf_name, storage_id) VALUES ('основная полка',1),('полка в шкафу',1), 
('в шуфлятке',2),('на тумбочке',2),
('полка над плитой',3),('антресоль левая',3),('антресоль правая',3),('антресоль цетральная',3),
('верхняя полка',4),('средняя полка',4),('открытая полка',4),('нижняя полка',4),
('Apple Books',5),('FBReader',5),('Text Viewer',5);

INSERT INTO author (author_name) VALUES ('Элияху Голдратт'),('Джефф Кокс'),('Мэг Джей'),('Джоан Роулинг'),('Фрэнк Герберт'),
('Джордж Оруэлл'), ('Энтони Бёрджесс'),('Агата Кристи'),('Стивен Кови'),('Дейл Карнеги'),('Михаил Булгаков'),('Лев Толстой'),
('Максим Батырев'),('Project Management Institute'), ('Rita Mulcahy');

INSERT INTO publisher (publisher_name) VALUES ('Попурри'),('Манн, Иванов и Фербер'),('Росмэн'),('АСТ'),('Эксмо'),('Альпина Паблишер'),
('Азбука'),('PMI'),('RMC Publications');

INSERT INTO book (book_name, volume, publication_year, genre, number_of_pages, book_language, electronic, publisher_id,shelf_id) 
VALUES ('Цель. Процесс непрерывного улучшения.',NULL,2021,'Business & Finance',400,'RU',0,1,1),
('Цель-2. Дело не в везении',NULL,2022,'Business & Finance',232,'RU',0,6,2),
('Выбор. Правила Голдратта',null,2019,'Business & Finance',208,'RU',0,1,3),
('Важные годы. Почему не стоит откладывать жизнь на потом',null,2017,'Business & Finance',320,'RU',0,2,4),
('Гарри Поттер и Философский камень',null,2000,'Fantasy',400,'RU',1,3,14),
('Гарри Поттер и Тайная комната',null,2001,'Fantasy',480,'RU',1,3,14),
('Гарри Поттер и Узник Азкабана',null,2001,'Fantasy',512,'RU',1,3,14),
('Гарри Поттер и Кубок огня',null,2002,'Fantasy',672,'RU',1,3,14),
('Гарри Поттер и Орден Феникса',null,2004,'Fantasy',832,'RU',1,3,14),
('Гарри Поттер и Дары Смерти',null,2007,'Fantasy',640,'RU',1,3,14),
('Сказки барда Бидля',null,2008,'Fantasy',null,'RU',1,3,14),
('Дюна',null,2021,'Science fiction',704,'RU',0,4,5),
('1984',null,2022,'Romance novel,Distopia',320,'RU',0,4,6),
('Заводной апельсин',null,2019,'Crime',256,'RU',1,4,13),
('Убийство в "Восточном экспрессе"',null,2019,'Crime,Detective fiction',320,'RU',0,5,7),
('Семь навыков высокоэффективных людей.',null,2019,'Crime,Detective fiction',396,'RU',1,6,15),
('Как завоёвывать друзей и оказывать влияние на людей',null,2022,'Business & Finance',352,'RU',0,1,8),
('Мастер и Маргарита',null,2012,'Classic,Romance novel',480,'RU',0,7,9),
('Собачье сердце',null,2013,'Classic,Romance novel',384,'RU',0,7,10),
('Белая гвардия',null,2021,'Classic,Romance novel',320,'RU',0,7,11),
('Анна Каренина',null,2012,'Classic,Romance novel',864,'RU',0,7,12),
('45 татуировок менеджера.',null,2021,'Business & Finance',304,'RU',0,2,1),
('PMBOK® Guide–Sixth Edition',null,2017,'Reference book',756,'ENG',0,8,2),
('PMBOK® Guide–Seventh Edition',null,2021,'Reference book',250,'ENG',1,8,13),
('PMP® Exam Prep, Tenth Edition - Upgraded',null,2022,'Reference book',500,'ENG',1,9,13);

INSERT INTO author_has_book (author_id, book_id) VALUES (1,1),(1,2),(2,1),(2,2),(1,3),(3,4),(4,5),(4,6),(4,7),(4,8),
(4,9),(4,10),(4,11),(5,12),(6,13),(7,14),(8,15),(9,16),(10,17),(11,18),
(11,19),(11,20),(12,21),(13,22),(14,23),(14,24),(15,25);

INSERT INTO book_review (rating, rid_of, read_status, book_id) 
VALUES (5,0,'had_read',1),(5,0,'had_read',2),(3,1,'had_read',4),(5,0,'had_read',5),
(5,0,'had_read',6),(5,0,'had_read',7),(5,0,'had_read',8),(5,0,'read',9),(5,0,'had_read',10),(5,0,'had_read',12),
(4,0,'had_read',13),(4,1,'had_read',14),(5,0,'had_read',15),(3,1,'had_read',16),(3,1,'had_read',17),(5,0,'had_read',18),
(5,0,'had_read',19),(4,0,'had_read',20),(4,0,'had_read',21),(2,1,'had_read',22),(5,0,'had_read',23);