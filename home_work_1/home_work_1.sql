CREATE TABLE goods (
    id_item INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    name_item VARCHAR(50) NOT NULL UNIQUE, 
    barcode CHAR(13), 
    manufacturer VARCHAR(30), 
    price DECIMAL(7,2) NOT NULL, 
    descrittion TEXT, 
    weight_kg FLOAT, 
    quantity_per_pack INT NOT NULL);

INSERT INTO goods (name_item, barcode,manufacturer,price,descrittion,weight_kg,quantity_per_pack) 
VALUES('сметана',4811567891234,'савушкин',2.50,'сметана жирностью 18',0.200,1);
INSERT INTO goods (name_item, barcode,manufacturer,price,descrittion,weight_kg,quantity_per_pack) 
VALUES('кефир',4814567891234,'савушкин',1.50,'кефир в пластиковой бутылке',1,1);
INSERT INTO goods (name_item, barcode,manufacturer,price,descrittion,weight_kg,quantity_per_pack) 
VALUES('творог',4814567891234,'савушкин',4.00,'творог жирностью 18',0.200,1);
INSERT INTO goods (name_item, barcode,manufacturer,price,descrittion,weight_kg,quantity_per_pack) 
VALUES('Coca-Cola 0,5',1234567891234,'Кока Кола РБ',4.99,NULL,0.5,1);
INSERT INTO goods (name_item, barcode,manufacturer,price,descrittion,weight_kg,quantity_per_pack) 
VALUES('Упаковка Coca-Cola 6 по 0,5',1237567891234,'Кока Кола РБ',25.99,'акционная упаковка колы в картонной коробке',3,6);
INSERT INTO goods (name_item, barcode,manufacturer,price,descrittion,weight_kg,quantity_per_pack) 
VALUES('Драники',4814567791234,'СП', 6.00,'драники собственного производства. Описание состава, описание БЖУ, описание условий хранения, описание способо приготовления',0.350,1);
INSERT INTO goods (name_item, barcode,manufacturer,price,descrittion,weight_kg,quantity_per_pack) 
VALUES('Акционная упаковка Orbit',1234567991234,'Orbit',1.20,'продаётся по акцииб вторая упаковка бесплатно',0.02,2);
INSERT INTO goods (name_item, barcode,manufacturer,price,descrittion,weight_kg,quantity_per_pack) 
VALUES('Вино',1234567891234,'Грузинское',32.00,'Красное сухое',0.75,1);


CREATE TABLE loyalty (
    id_card INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    issue_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    first_name VARCHAR(50) NOT NULL, 
    second_name  VARCHAR(50), 
    mobile CHAR(12), 
    email VARCHAR(50) NOT NULL UNIQUE, 
    birthday DATE, 
    discount VARCHAR(30) DEFAULT 5, 
    loyalty_type ENUM('bronze','silver','gold') DEFAULT 'bronze');

INSERT INTO loyalty (issue_date, first_name, second_name, mobile, email, birthday, discount, loyalty_type) 
VALUES ('2022-01-15', 'Александр','Александров', 375291111111, 'gmail@gmail.com','1980-02-15', 5, 'bronze');
INSERT INTO loyalty (first_name, second_name, mobile, email, birthday) 
VALUES ( 'иван','иванов', 375292222222, 'mail@mail.ru','1990-02-15');
INSERT INTO loyalty (issue_date, first_name, second_name, mobile, email, birthday, discount, loyalty_type) 
VALUES ('2022-03-15', 'Владимир','Владимиров', 375293333333, 'g@gmail.com','2000-02-15', 5, 'gold');
INSERT INTO loyalty (issue_date, first_name, second_name, mobile, email, birthday, discount, loyalty_type) 
VALUES ('2022-04-15', 'Сергей','Сергеев', 375294444444, 'm@gmail.com','1985-02-15', 5, 'bronze');
INSERT INTO loyalty (first_name, second_name, mobile, email, birthday, discount, loyalty_type) 
VALUES ( 'игорь','игорев', 375295555555, 'ab@gmail.com','1995-02-15', 5, 'silver');
INSERT INTO loyalty (issue_date, first_name, second_name, mobile, email, birthday, discount, loyalty_type) 
VALUES ('2022-05-25', 'Максим','Максимов', 375296666666, 'i@gmail.com','2005-02-15', 5, 'gold');
INSERT INTO loyalty (issue_date, first_name, second_name, mobile, email, birthday, discount, loyalty_type) 
VALUES ('2022-06-15', 'Евгений','Евгеньев', 375297777777, 'l@gmail.com','1981-02-15', 5, 'bronze');
INSERT INTO loyalty (issue_date, first_name, second_name, mobile, email, birthday, discount, loyalty_type) 
VALUES ('2022-07-15', 'Петр','Петров', 375298888888, 'gm@gmail.com','1982-02-15', 5, 'silver');


CREATE TABLE vehicle (
    id_vehicle INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    make VARCHAR(25) NOT NULL, 
    model VARCHAR(25) NOT NULL,  
    body_type ENUM('roadster', 'sedan','vagon','SUV'),  
    color VARCHAR(25), 
    engine_type ENUM('petrol', 'diesel','hybrid','electric'), 
    registration TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    capacity INT NULL);

INSERT INTO vehicle (make, model, body_type, color, engine_type, registration, capacity) 
VALUES ('BMW', '3-series', 'sedan', 'black', 'petrol', '2015-01-01', 3000);
INSERT INTO vehicle (make, model, body_type , color, engine_type, registration, capacity) 
VALUES ('BMW', '7-series', 'sedan', 'black', 'petrol', '2015-01-01', 6000);
INSERT INTO vehicle (make, model, body_type , color, engine_type, registration, capacity) 
VALUES ('BMW', 'X7', 'SUV', 'blue', 'petrol', '2019-01-01', 4400);
INSERT INTO vehicle (make, model, body_type , color, engine_type, registration, capacity) 
VALUES ('Mercedes-Benz', 'C-class', 'vagon', 'silver', 'diesel', '2020-06-01', 1800);
INSERT INTO vehicle (make, model, body_type , color, engine_type, registration, capacity) 
VALUES ('Mercedes-Benz', 'G-class', 'SUV', 'black', 'petrol', '2020-06-01', 4000);
INSERT INTO vehicle (make, model, body_type , color, engine_type, registration, capacity) 
VALUES ('BMW', '7-series', 'sedan', 'green', 'hybrid', '2021-01-01', 3000);
INSERT INTO vehicle (make, model, body_type , color, engine_type, registration) 
VALUES ('Tesla', 'Model S', 'sedan', 'red', 'electric', '2020-01-01');
INSERT INTO vehicle (make, model, body_type , color, engine_type, registration, capacity) 
VALUES ('BMW', 'Z4', 'roadster', 'gray', 'petrol', '2017-01-01', 3000);
INSERT INTO vehicle (make, model, body_type , color, engine_type, registration, capacity) 
VALUES ('Mercedes-Benz', 'SL-class', 'roadster', 'silver', 'petrol', '2005-06-01', 5000);