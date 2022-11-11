DELIMITER $$
CREATE TRIGGER archive_book_location_moving
AFTER UPDATE 
ON book
FOR EACH ROW 
IF NEW.shelf_id!=OLD.shelf_id THEN 
INSERT INTO location_for_book_archive (previous_shelf_id, new_shelf_id, book_id) VALUES (OLD.shelf_id, NEW.shelf_id, NEW.id_book);
END IF $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER delete_book
BEFORE DELETE
ON book
FOR EACH ROW
BEGIN 
	DELETE FROM author_has_book WHERE book_id=OLD.id_book;
	DELETE FROM book_review WHERE book_id=OLD.id_book;
END
$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER after_delete_book
AFTER DELETE
ON book
FOR EACH ROW
INSERT INTO deleted_book (book_name, volume, publication_year, genre, number_of_pages, book_language, 
electronic, publisher_id) VALUES (OLD.book_name, OLD.volume, OLD.publication_year, OLD.genre, OLD.number_of_pages, 
OLD.book_language, OLD.electronic, OLD.publisher_id);
$$
DELIMITER ;