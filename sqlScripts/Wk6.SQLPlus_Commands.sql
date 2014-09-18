--1
SELECT customerid, firstname, lastname,
NVL(TO_CHAR(referred, 99), 'NOT REFERRED') AS "REFERRED BY"
FROM Book_Customer
WHERE referred IS NULL;

--2
SELECT title, SUBSTR(isbn, 1,1) ||'-'|| SUBSTR(isbn, 1, 3)
|| '-' || SUBSTR(isbn, 3,5) ||'-'|| SUBSTR(isbn, 9, 1)
AS "IBSN CODE"
FROM BOOKS
WHERE Category = 'COMPUTER';

--3
SELECT Category, TO_CHAR(SUM(Retail), '$9999.99') AS "Total Retail",
TO_CHAR(AVG(Retail), '$9999.99') AS "Average Retail"
FROM Books
GROUP BY Category
HAVING SUM(Retail) > 40;

--4
SELECT DISTINCT Title "Book Title", COUNT(*) "Number of Authors"
FROM Books , Book_Author 
WHERE books.Bookid = Book_Author.bookid
GROUP BY Title HAVING COUNT(*) > 1;

--5
SELECT bookid, fname, lname
FROM book_author, author
WHERE book_author.authorid = author.authorid
and bookid = (SELECT bookid 
FROM order_items
GROUP BY bookid
HAVING SUM(Quantity)=
(SELECT MAX(SUM(QUantity)) 
FROM Order_Items
GROUP BY Bookid));

--6
SELECT Book_Customer.Customerid, Book_Customer.Firstname
||' '||Lastname "CUSTOMER NAME", city
FROM Book_customer , Book_order ,Order_Items  
where book_customer.customerid = book_order.customerid
AND Book_Order.Orderid = order_items.orderid
AND Order_Items.Itemnum = 
(SELECT Itemnum FROM Books
WHERE Retail = (SELECT MAX(Retail)
FROM Books)
);

--7
SELECT itemnum, SUM(Quantity) AS "Total", 
TO_CHAR(AVG(Quantity), '9999.99') AS "Average",
MIN(Quantity) AS "Minimum", MAX(Quantity) AS "Maximum"
FROM Order_Items
GROUP BY ItemNum;

--8
SELECT title, pubdate, 
DECODE(PUBID, 1, 'PRINTING IS US', 
2,'PUBLISH OUR WAY',
3,'AMERICAN PUBLISHING',
4,'READING MATERIALS',
5,'REED-N-RITE',
'LITTLE HOUSE')
AS "Publisher Name"
from bOOKS
ORDER BY "Publisher Name" DESC;

--9
SELECT 'The contact person for ' || publishername 
|| ' is ' || contactname || '.'
FROM publisher;


--10
SELECT lastname,city,state,quantity "Number Purchased"
FROM book_customer, book_order, order_items 
WHERE book_customer.customerID = book_order.customerid
AND Book_Order.orderid = Order_Items.Orderid
AND Quantity > 2;

-11
SELECT isbn, pubID, retail
FROM Books;
UPDATE books
SET retail = retail*1.05
WHERE pubid = 
(select pubid FROM publisher
WHERE publishername='PRINTING IS US')
SELECT isbn, pubID, retail
FROM Books;
ROLLBACK

--12
SELECT firstname, lastname
FROM Book_Customer
WHERE Referred = 
(SELECT Referred 
FROM book_customer
WHERE firstname = 'JORGE'
AND Lastname = 'PEREZ')
AND Firstname != 'JORGE'
AND Lastname != 'PEREZ';

--13
SELECT category, COUNT(Category) AS "CATEGORY TOTAL",
TO_CHAR(SUM(Retail), '$9999.99') AS "Cost"
FROM Books
GROUP BY Category;
