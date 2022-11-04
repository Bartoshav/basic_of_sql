CREATE DATABASE final_project;

USE final_project;

CREATE TABLE storage (
	id_storage INT NOT NULL AUTO_INCREMENT,
    storage_name VARCHAR(25) NOT NULL,
    PRIMARY KEY (id_storage)
    );
    
CREATE TABLE shelf (
	id_shelf INT NOT NULL AUTO_INCREMENT,
    shelf_name VARCHAR(50) NOT NULL,
    storage_id INT NOT NULL,
    PRIMARY KEY (id_shelf),
    FOREIGN KEY (storage_id) REFERENCES storage (id_storage)
    );
    
CREATE TABLE author (
	id_author INT NOT NULL AUTO_INCREMENT,
	author_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_author)
	);

CREATE TABLE publisher(
	id_publisher INT NOT NULL AUTO_INCREMENT,
    publisher_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_publisher)
    );

CREATE TABLE book (
	id_book INT NOT NULL AUTO_INCREMENT,
    book_name VARCHAR(75) NOT NULL,
    volume INT DEFAULT NULL,
    publication_year CHAR(4) DEFAULT NULL,
    genre SET("Crime", "Detective fiction", "Science fiction", "Distopia", "Fantasy", "Cyberpunk", "Romance novel", "Classic", "Fairy tale", "Reference book", "Business & Finance") DEFAULT NULL,
    number_of_pages INT DEFAULT NULL,
    book_language ENUM("ENG", "RU", "BY") DEFAULT NULL,
    electronic BOOLEAN DEFAULT 0,
    publisher_id INT NOT NULL,
    PRIMARY KEY (id_book),
    FOREIGN KEY (publisher_id) REFERENCES publisher(id_publisher)  
    );
    
CREATE TABLE author_has_book (
	id_author_has_book INT NOT NULL AUTO_INCREMENT,
    author_id INT NOT NULL,
    book_id INT NOT NULL,
	PRIMARY KEY (id_author_has_book),
    FOREIGN KEY (author_id) REFERENCES author(id_author),
    FOREIGN KEY (book_id) REFERENCES book(id_book)
    );
    
CREATE TABLE location_for_book (
	id_location_for_book INT NOT NULL AUTO_INCREMENT,
    moving_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    shelf_id INT NOT NULL,
    book_id INT NOT NULL,
    PRIMARY KEY (id_location_for_book),
	FOREIGN KEY (shelf_id) REFERENCES shelf(id_shelf),
    FOREIGN KEY (book_id) REFERENCES book(id_book)
    );
    
CREATE TABLE book_review (
	id_book_review INT NOT NULL AUTO_INCREMENT,
    rating INT DEFAULT NULL,
    rid_of BOOLEAN DEFAULT 0,
    read_status ENUM ("read","had_read") DEFAULT NULL,
    book_id INT NOT NULL,
    PRIMARY KEY (id_book_review),
    FOREIGN KEY (book_id) REFERENCES book(id_book)
    );
