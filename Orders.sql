SHOW DATABASES;
USE exDB;
SHOW TABLES;

drop TABLE Orders;

CREATE TABLE Orders (
	OrderID INT,
	CustomerID INT,
	EmployeeID INT,
	OrderDate DATE,
	ShipperID INT
);

SELECT * FROM Orders;
