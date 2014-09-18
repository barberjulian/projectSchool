--1
CREATE OR REPLACE VIEW CUST_VIEW AS 
SELECT customerid, firstname, lastname, state FROM Book_Customer;
INSERT INTO CUST_VIEW(CustomerID, FirstName, LastName, State) VALUES ('1021', 'EDWARD', 'BLAKE', 'TX');
SELECT * FROM CUST_VIEW;

--2
CREATE OR REPLACE VIEW CUST_ORDER AS
SELECT Book_Customer.CustomerID, LastName, State, OrderID, OrderDate
FROM Book_Customer JOIN Book_Order ON
Book_Customer.CustomerID = Book_Order.CustomerID;
INSERT INTO CUST_ORDER(CustomerID, LastName, State, OrderID, OrderDate) VALUES ('1002', 'smith', 'KS', '1021', '10-OCT-2004')

--3
/*The insert statement cannot insert data into two different tables
without a trigger.*/

--4
CREATE SEQUENCE PUBNUM_SEQ
START WITH 7
INCREMENT BY 2
MAXVALUE 1000;

--5

INSERT INTO Publisher(PubID, PublisherName, ContactName, Phone) 
VALUES (PUBNUM_SEQ.NextVal, 'Double Week', 'Jennifer Close', '800-959-6321');
INSERT INTO Publisher(PubID, PublisherName, ContactName, Phone) 
VALUES (PUBNUM_SEQ.NextVal, 'Specific House', 'Freddie Farmore', '866-825-3200');
SELECT * FROM Publisher;

--6
SELECT PUBNUM_SEQ.CurrVal, PUBNUM_SEQ.NextVal FROM DUAL;

--7
CREATE INDEX BOOK_ORDER_INDEX
ON Book_Order ( OrderID, CustomerID);

--8
SELECT Object_Name, count(object_type) "Count"
FROM USER_OBJECTS
GROUP BY Object_Name;