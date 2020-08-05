-- ### Order
-- 1. Find all subjects sorted by subject
    SELECT subject FROM subjects;

-- 2. Find all subjects sorted by location
    SELECT * FROM subjects ORDER BY location;

-- ### Where
-- 3. Find the book "Little Women"
    SELECT * FROM books WHERE title = 'Little Women';

-- 4. Find all books containing the word "Python"
    SELECT * FROM books WHERE title LIKE '%Python';

-- 5. Find all subjects with the location "Main St" sort them by subject
    SELECT * FROM subjects WHERE location = 'Main St' ORDER BY subject;

-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
    SELECT b.title FROM books b JOIN subjects s ON b.subject_id=s.id WHERE s.subject = 'Computers';

-- 7. Find all books and display a result table with ONLY the following columns
    SELECT title, first_name, last_name, subject FROM books, authors, subjects WHERE books.author_id = authors.id AND books.subject_id = subjects.id;

-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject
-- 8. Find all books that are listed in the stock table
    SELECT books.title, stock.retail FROM books INNER JOIN editions ON books.id = editions.book_id INNER JOIN stock ON stock.isbn = editions.isbn ORDER BY stock.retail DESC;

-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price
-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price
    SELECT books.title, editions.isbn, publishers.name AS publisher, stock.retail FROM books INNER JOIN editions ON books.id = editions.book_id INNER JOIN publishers ON editions.publisher_id = publishers.id INNER JOIN stock ON stock.isbn = editions.isbn WHERE books.title = 'Dune';

-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title

    SELECT customers.first_name, customers.last_name, shipments.ship_date, books.title FROM shipments JOIN editions ON editions.isbn = shipments.isbn JOIN customers ON shipments.customer_id = customers.id JOIN books ON editions.book_id=books.id ORDER BY shipments.ship_date ASC;

-- ### Grouping and Counting

-- 11. Get the COUNT of all books


-- 12. Get the COUNT of all Locations
-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
