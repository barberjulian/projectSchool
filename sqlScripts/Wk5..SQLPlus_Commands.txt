--1

SELECT title, contactname, phone FROM publisher NATURAL JOIN books
WHERE publishername LIKE 'R%';

--2
SELECT TO_CHAR(sysdate, 'DAY HH/MI/SS') "DATE"
FROM Dual;

--3
SELECT lastname || ', ' || firstname AS "Customer Name", orderid FROM book_customer NATURAL JOIN book_order
WHERE shipdate < sysdate
ORDER BY customerid ASC;

--4
SELECT orderid, shipstreet, shipcity, shipstate, shipzip,
TO_CHAR(orderdate, 'Month DD/YYYY')
AS "Date Ordered"
from Book_order
WHERE shipcity = 'ATLANTA' or shipcity = 'AUSTIN';


--5
SELECT orderid, TO_CHAR(orderdate, 'MM/DD/YYYY') AS "Order Date", shipdate,
ROUND(MONTHS_BETWEEN(shipdate, orderdate),2) AS "Months Between"
FROM BOOK_ORDER
WHERE shipdate IS NOT NULL;

--6
SELECT title AS "Book Title", fname AS "First Name", lname AS "Last Name"
FROM books 
LEFT OUTER JOIN book_author 
ON books.bookid = book_author.bookid
LEFT OUTER JOIN author
ON author.authorid = book_author.authorid
ORDER BY books.title ASC, author.lname ASC;


--7
SELECT title, TO_CHAR(cost, '$999.99') AS "Cost", TO_CHAR(retail, '$999.99') AS "Retail"
FROM Books
WHERE title LIKE 'H%';

--8
SELECT title, orderdate, book_order.orderid
FROM book_order 
FULL OUTER JOIN Order_items 
ON book_order.orderid = order_items.orderid
FULL OUTER JOIN books 
ON books.bookid = order_items.bookid
ORDER BY order_items.bookid DESC;

--9
SELECT DISTINCT lastname, firstname, title, TO_CHAR(orderdate, 'MM/DD/YYYY') AS "Order Date"
FROM Publisher, books, book_customer, book_order
WHERE 
books.pubid = publisher.pubid
AND
book_order.customerid = book_customer.customerid
AND 
publisher.publishername = 'PRINTING IS US'
;

STEP 10:

Back to top
Using the BOOKS and ORDER_ITEMS table, write a query using the correct 
Relational Set Operator that will show all of the Book IDs in the BOOKS 
table that have not been ordered.



--11
SELECT book_customer.customerid, firstname,lastname, title
FROM 
Book_customer, Book_Order, Order_Items, Books
WHERE
book_order.customerid = book_customer.customerid
AND
books.bookid = order_items.bookid
AND
order_items.orderid = book_order.orderid
AND category = 'FITNESS';

--12
SELECT title, retail, quantity, orderdate
FROM Books, order_items, book_order
WHERE
books.bookid = order_items.bookid
AND
order_items.orderid = book_order.orderid
AND 
orderdate > '30-APR-2009';

--13
SELECT order_items.orderid, 
TO_CHAR(orderdate, 'MM/DD/YYYY') AS "Order Date", 
quantity, 
TO_CHAR(retail, '$99.99') AS Retail
FROM order_items, book_order, books
WHERE
books.bookid = order_items.bookid
AND
order_items.orderid = book_order.orderid;
