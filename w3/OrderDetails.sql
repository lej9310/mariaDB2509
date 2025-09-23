SHOW DATABASES;
USE exDB;
SHOW TABLES;

-- drop TABLE OrderDetails;

CREATE TABLE OrderDetails (
	OrderDetailID INT,
	OrderID INT,
	ProductID INT,
	Quantity INT
);

SELECT * FROM OrderDetails;		
