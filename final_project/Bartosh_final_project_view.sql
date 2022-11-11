CREATE VIEW books_by_shelfs AS
SELECT st.storage_name AS storage, sh.shelf_name AS shelf, b.book_name AS book
FROM book b
LEFT JOIN shelf sh ON b.shelf_id=sh.id_shelf
LEFT JOIN storage st ON sh.storage_id=st.id_storage
ORDER BY storage, shelf;

CREATE VIEW authors_and_books AS
SELECT a.author_name AS author, b.book_name AS book 
FROM author_has_book ahb
LEFT JOIN book b ON ahb.book_id=b.id_book
LEFT JOIN author a ON ahb.author_id=a.id_author
ORDER BY author, book;

CREATE VIEW books_review AS
SELECT b.book_name AS book, br.rating AS rating, br.read_status AS read_status, IF (br.rid_of=1, 'rid it of', 'nope') AS shell_I_rid_it_of FROM book_review br
LEFT JOIN book b ON br.book_id=b.id_book
ORDER BY book;

CREATE VIEW books_read AS
SELECT b.book_name AS book, st.storage_name AS storage, sh.shelf_name AS shelf FROM book_review br
LEFT JOIN book b ON br.book_id=b.id_book
LEFT JOIN shelf sh ON b.shelf_id=sh.id_shelf
LEFT JOIN storage st ON sh.storage_id=st.id_storage
WHERE read_status='read'
ORDER BY book;

CREATE VIEW rid_it_of AS 
SELECT b.book_name AS book, st.storage_name AS storage, sh.shelf_name AS shelf FROM book_review br
LEFT JOIN book b ON br.book_id=b.id_book
LEFT JOIN shelf sh ON b.shelf_id=sh.id_shelf
LEFT JOIN storage st ON sh.storage_id=st.id_storage
WHERE rid_of=1
ORDER BY book;

CREATE VIEW books AS 
SELECT b.book_name AS book, a.author_name AS author, volume, publication_year, genre, number_of_pages, book_language, 
IF(electronic=0,'paper','electronic') as paper_or_electorinc,
st.storage_name AS storage, sh.shelf_name AS shelf 
FROM author_has_book ahb 
RIGHT JOIN book b ON ahb.book_id=b.id_book
LEFT JOIN author a ON ahb.author_id=a.id_author
LEFT JOIN shelf sh ON b.shelf_id=sh.id_shelf
LEFT JOIN storage st ON sh.storage_id=st.id_storage;