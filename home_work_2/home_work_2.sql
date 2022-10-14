CREATE DATABASE homework2;

USE homework2;

CREATE TABLE country (
	id_country INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(25) NOT NULL,
    PRIMARY KEY (id_country)
    );

INSERT INTO country (name) VALUES ('Italy'),('Japan'),('USA'),('Germany');


CREATE TABLE manufacturer (
	id_manufacturer INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(25) NOT NULL,
    country_id INT NOT NULL,
    PRIMARY KEY (id_manufacturer),
    FOREIGN KEY	(country_id) REFERENCES country (id_country)
    );

INSERT INTO manufacturer (name, country_id) VALUES ('Ducati', 1), ('MV Agusta',1), ('Aprilia',1), ('Yamaha', 2), ('Honda',2),('Suzuki',2),('Harley-Davidson',3),('BMW',4);

CREATE TABLE model (
	id_model INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(25) NOT NULL,
    year INT NOT NULL,
    manufacturer_id INT NOT NULL,
    PRIMARY KEY (id_model),
    FOREIGN KEY (manufacturer_id) REFERENCES manufacturer (id_manufacturer)
    );

INSERT INTO model (name, year, manufacturer_id) VALUES 
('Diavel', 2015,1), ('Xdiavel', 2020,1), ('Monster', 2004,1), ('SuperSport', 2022,1), ('Panigale', 2021,1), ('Multistrada', 2018,1),
('Brutale', 2022,2), ('Dragster', 2015,2), ('F3', 2020,2),
('Tuono', 2015,3), ('RSV4', 2008,3), ('Tuono V4', 2022,3),
('R-1', 2020,4),('R-7', 2022,4),('MT-10', 2015,4),('MT-09', 2017,4),('MT-07', 2015,4), ('FJR1300', 2009,4),
('Gold Wing', 1992,5), ('CBR1000RR', 2012,5), ('CBR600RR', 2015,5), ('CB1000R', 2020,5), ('CBR650R', 2021,5), ('CB650R', 2019,5), ('Africa Twin', 2018,5),
('GSX-R1000R', 1997,6), ('GSX-S1000', 2017,6), ('V-Strom 1050', 2022,6), ('Katana', 2022,6),
('FAT BOB', 2020,7), ('FAT BOY', 1997,7), ('ROAD GLIDE', 2022,7),
('K 1600B', 2022,8), ('R1250RT', 2010,8), ('S1000R', 2015,8), ('R nineT', 2020,8), ('R1250GS', 2022,8);

CREATE TABLE author (
	id_author INT NOT NULL AUTO_INCREMENT, 
    name VARCHAR(25) NOT NULL, 
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    birthday DATE DEFAULT NULL, 
	PRIMARY KEY (id_author)
    );

INSERT INTO author (name) VALUES ('Вова');
INSERT INTO author (name, birthday) VALUES ('Александр','1985-01-01'), ('Призрачный гонщик','2000-06-01'), ('Путешественник','1995-09-01');

CREATE TABLE moto_of_author (
	id_moto INT NOT NULL AUTO_INCREMENT,
    author_id INT NOT NULL,
    model_id INT NOT NULL, 
    model_comment VARCHAR (25) DEFAULT NULL,
    PRIMARY KEY (id_moto),
    FOREIGN KEY (model_id) REFERENCES model (id_model),
    FOREIGN KEY (author_id) REFERENCES author (id_author)
    );
    
INSERT INTO moto_of_author (author_id, model_id) VALUES (2,2),(1,32);
INSERT INTO moto_of_author (author_id, model_id, model_comment) VALUES (3,22,'сибиха'),(4,37,'гусь'),(4,24,'на каждый день');

CREATE TABLE post (
	id_post INT NOT NULL AUTO_INCREMENT,
	publication_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	author_id INT NOT NULL,
	status ENUM ('draft','posted'),
    header VARCHAR (140) NOT NULL,
	post_text MEDIUMTEXT DEFAULT NULL,
    PRIMARY KEY (id_post),
    FOREIGN KEY (author_id) REFERENCES author (id_author)
    );

INSERT INTO post (author_id, status, header, post_text) VALUES 
(1,'draft','Заголовок поста ','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut 
enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur 
sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(2,'draft','Тут будет заголовок ','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut 
enim ad minim veniam, quis nostrud exercitation ullamco '),
(3,'posted','Сезонное обслуживание ','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut 
enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur 
sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(4,'posted','Поездка в Альпы','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut 
enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur 
sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');

CREATE TABLE foto (
	id_foto INT NOT NULL AUTO_INCREMENT,
	post_id INT NOT NULL,
	link VARCHAR (50) NOT NULL,
    PRIMARY KEY (id_foto),
    FOREIGN KEY (post_id) REFERENCES post (id_post)
    );
    
INSERT INTO foto (post_id, link) VALUES (1,'./user1/1.jpeg'),(1,'./user1/2.jpeg'),(2,'./user2/1.jpeg'),(3,'./user3/1.jpeg'),(4,'./user4/1.jpeg'),(4,'./user4/2.jpeg'),(4,'./user4/3.jpeg'),(4,'./user4/4.jpeg');

CREATE TABLE comment (
	id_comment INT NOT NULL AUTO_INCREMENT,
	post_id INT NOT NULL,
	comment_author_id INT NOT NULL,
	publication_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	comment TINYTEXT,
    PRIMARY KEY (id_comment),
    FOREIGN KEY (post_id) REFERENCES post (id_post),
    FOREIGN KEY (comment_author_id) REFERENCES author (id_author)
    );
    
INSERT INTO comment (post_id, comment_author_id, comment) VALUES (1,4,'первый');

CREATE TABLE likes (
	id_like INT NOT NULL AUTO_INCREMENT,
    like_author_id INT NOT NULL,
    like_post_id INT NOT NULL,
    PRIMARY KEY (id_like),
    FOREIGN KEY (like_author_id) REFERENCES author (id_author),
    FOREIGN KEY (like_post_id) REFERENCES post (id_post),
    UNIQUE (like_author_id,like_post_id)
	);
    
INSERT INTO likes (like_author_id, like_post_id) VALUES (1,1),(1,2),(1,3),(1,4),(2,1),(3,1),(4,1),(4,2);

CREATE TABLE frend(
	id_relation INT NOT NULL AUTO_INCREMENT,
    author_id INT NOT NULL,
    freiend_id INT NOT NULL,
    UNIQUE (author_id, freiend_id),
    PRIMARY KEY (id_relation),
    FOREIGN KEY (author_id) REFERENCES author (id_author),
    FOREIGN KEY (freiend_id) REFERENCES author (id_author)
);

INSERT INTO frend (author_id, freiend_id) VALUES (1,2),(1,3),(1,4),(4,1),(4,3),(3,4),(3,2);


#DROP TABLE frend;
