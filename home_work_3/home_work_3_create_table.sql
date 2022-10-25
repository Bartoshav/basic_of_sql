CREATE DATABASE homework3;

USE homework3;

CREATE TABLE goods_сategory (
	id_goods_category INT NOT NULL AUTO_INCREMENT,
    goods_сategory_name VARCHAR(25) NOT NULL,
    PRIMARY KEY (id_goods_category)
    );
    
CREATE TABLE goods (
	id_goods INT NOT NULL AUTO_INCREMENT,
    goods_name VARCHAR(25) NOT NULL,
    price DECIMAL(10,2),
    goods_category_id INT NOT NULL,
    PRIMARY KEY (id_goods),
    FOREIGN KEY (goods_category_id) REFERENCES goods_сategory (id_goods_category)
    );
    
CREATE TABLE customer (
	id_customer INT NOT NULL AUTO_INCREMENT,
    customer_name VARCHAR(25) NOT NULL,
    PRIMARY KEY (id_customer)
    );
       
CREATE TABLE customer_order (
	id_order INT NOT NULL AUTO_INCREMENT,
    quantity INT NOT NULL,
    customer_id INT NOT NULL,
    goods_id INT NOT NULL,
    CHECK(quantity>0),
    PRIMARY KEY (id_order),
    FOREIGN KEY (customer_id) REFERENCES customer (id_customer),
    FOREIGN KEY (goods_id) REFERENCES goods (id_goods)
    );
