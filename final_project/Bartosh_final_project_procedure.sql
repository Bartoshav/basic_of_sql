DELIMITER $$
CREATE PROCEDURE read_book (name_book VARCHAR(75))
BEGIN 
	INSERT INTO book_review(read_status,book_id) VALUES('read',(SELECT id_book FROM book WHERE book_name=name_book)); 
END $$
DELIMITER ;    

DELIMITER $$
CREATE PROCEDURE book_had_read (name_book VARCHAR(75), rating_book INT)
BEGIN 
	UPDATE book_review 
    SET 
    read_status='had_read', 
    rating=rating_book
    WHERE book_id=(SELECT id_book FROM book WHERE book_name=name_book);
END $$
DELIMITER ; 