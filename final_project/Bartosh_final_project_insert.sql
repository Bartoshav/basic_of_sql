INSERT INTO storage(storage_name) VALUES ('шкаф в туалете'), ('прикроватная тумбочка'), ('кухня'), ('шкаф в кабинете'), ('iPad');

INSERT INTO shelf (shelf_name, storage_id) VALUES ('основная полка',1),('полка в шкафу',1), 
('в шуфлятке',2),('на тумбочке',2),
('полка над плитой',3),('антресоль левая',3),('антресоль правая',3),('антресоль цетральная',3),
('верхняя полка',4),('средняя полка',4),('открытая полка',4),('нижняя полка',4),
('Apple Books',5),('FBReader',5),('Text Viewer',5);

INSERT INTO author (author_name) VALUES ('Элияху Голдратт'),('Джефф Кокс'),('Мэг Джей'),('Джоан Роулинг'),('Фрэнк Герберт'),('Джордж Оруэлл'),
('Энтони Бёрджесс'),('Агата Кристи'),('Стивен Кови'),('Дейл Карнеги'),('Михаил Булгаков'),('Лев Толстой'),('Максим Батырев'),('Project Management Institute'),
('Rita Mulcahy');




Select * FROM storage;

SELECT s.storage_name AS storage, sf.shelf_name AS shelf, id_shelf  FROM storage s
JOIN shelf sf
ON s.id_storage=sf.storage_id;

SELECT * FROM author;
