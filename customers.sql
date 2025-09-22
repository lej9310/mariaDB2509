SHOW DATABASES;
USE exDB;
SHOW TABLES;

drop TABLE customers;

CREATE TABLE Customers (
	CustomerID INT,
	CustomerName VARCHAR(100),
	ContactName	VARCHAR(50),
	Address VARCHAR(50),
	City VARCHAR(20),
	PostalCode VARCHAR(20),
	Country VARCHAR(20)
);

SELECT * FROM customers;
